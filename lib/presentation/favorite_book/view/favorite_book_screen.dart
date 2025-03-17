import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/data/model/favorite_book_model.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_cubit.dart';
import 'package:one_does_project/presentation/favorite_book/view_model/favorite_book_cubit.dart';
import 'package:one_does_project/presentation/favorite_book/view_model/favorite_book_state.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/image_path_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';
import 'package:one_does_project/presentation/widgets/appbar_menu.dart';
import 'package:one_does_project/presentation/widgets/book_loading.dart';
import 'package:one_does_project/presentation/widgets/bottom_Navigation_Bar.dart';
import 'package:one_does_project/presentation/widgets/info_error_card.dart';
import 'package:one_does_project/presentation/widgets/list_tile_card.dart';
import 'package:one_does_project/translations/locale_keys.g.dart';

class FavoriteBooksScreen extends StatelessWidget {
  const FavoriteBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigateBottomBar(),
      appBar: CustomAppBarTitle(
        title: Text(
          LocaleKeys.appBar_favorite.tr(),
          style: getBoldPrimaryStyleTitle(),
        ),
      ),

      body: BlocBuilder<FavoriteBooksCubit, FavoriteBookState>(
        builder: (context, state) {
          if (state is FavoriteBookLoading) {
            return BookLoading();
          } else if (state is FavoriteBookDisplay) {
            var favorites = state.favorites;
            if (favorites.isEmpty) {
              return const Center(child: Text("Henüz favori kitap yok."));
            }
            SizedBox(height: AppSizeHeight.s16);
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return CustomListTileCard(
                  title: favorites[index].title ?? "",
                  subTitle: Text(favorites[index].publisher ?? "-"),
                  leading: Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 5),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(ImagePathManager.instance.bookImage),
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  trailing: Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 5),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: ColorManager.instance.primary,
                      ),
                      onPressed: () async {
                        var book = FavoriteBookModel(
                          id: favorites[index].id,
                          title: favorites[index].title,
                          handle: favorites[index].handle,
                          publisher: favorites[index].publisher,
                        );

                        // Favoriden çıkarma işlemi
                        context.read<FavoriteBooksCubit>().removeFromFavorites(
                          book,
                        );

                        // Favoriden çıkarıldı diyalog kutusunu göster
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons
                                          .favorite_border, // Favori ikonu boş olacak
                                      color: ColorManager.instance.primary,
                                      size: 40,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      LocaleKeys.text_favorite_remove.tr(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.instance.black,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      LocaleKeys.text_favorite_succes_remove
                                          .tr(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorManager.instance.primary,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(
                                          context,
                                        ).pop(); // Diyalog kutusunu kapat
                                      },
                                      style: ElevatedButton.styleFrom(
                                        iconColor:
                                            ColorManager.instance.primary,
                                      ),
                                      child: Text(
                                        LocaleKeys.text_ok.tr(),
                                        style: getBoldBlackStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is FavoriteBookError) {
            return BasicInfoCard(
              firstDescription: state.title,
              secondDescription: state.description,
            );
          } else {
            return BasicInfoCard(
              firstDescription: LocaleKeys.text_no_favorite_found_title.tr(),
              secondDescription: LocaleKeys.text_no_favorite_found_desc.tr(),
            );
          }
        },
      ),
    );
  }
}
