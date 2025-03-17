import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:one_does_project/app/notification/notification_manager.dart';
import 'package:one_does_project/data/model/favorite_book_model.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_cubit.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_state.dart';
import 'package:one_does_project/presentation/detail_book/view/detail_book_screen.dart';
import 'package:one_does_project/presentation/favorite_book/view_model/favorite_book_cubit.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/extension.dart';
import 'package:one_does_project/presentation/resources/image_path_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/presentation/resources/values_manager.dart';
import 'package:one_does_project/presentation/widgets/appbar_menu.dart';
import 'package:one_does_project/presentation/widgets/book_loading.dart';
import 'package:one_does_project/presentation/widgets/bottom_Navigation_Bar.dart';
import 'package:one_does_project/presentation/widgets/drawer_menu.dart';
import 'package:one_does_project/presentation/widgets/info_error_card.dart';
import 'package:one_does_project/presentation/widgets/list_tile_card.dart';
import 'package:one_does_project/presentation/widgets/search_bar.dart';
import 'package:one_does_project/translations/locale_keys.g.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with _PageProperties {
  final TextEditingController _searchController = TextEditingController();

  void addToFavorites(FavoriteBookModel book) async {
    var box = await Hive.openBox<FavoriteBookModel>('favoritesBox');
    await box.add(book); // Kitabı favorilere ekle
  }

  // Favori kitapları almak
  Future<List<FavoriteBookModel>> getFavorites() async {
    var box = await Hive.openBox<FavoriteBookModel>('favoritesBox');
    return box.values.toList(); // Favori kitapları döndür
  }

  @override
  void initState() {
    _initCubit();
    _connection();
    context.read<BookListCubit>().getBookList();
    super.initState();
  }

  void _initCubit() {
    _bookListCubit = context.read<BookListCubit>();
  }

  void _connection() async {
    _bookListCubit.listenToConnectivityChanges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.instance.primary,
        onPressed: () async {
          final now = DateTime.now();
          final scheduledTime = now.add(Duration(seconds: 5));

          // Scheduled time'ın gelecekte olduğundan emin olun
          if (scheduledTime.isBefore(now)) {
            print("Scheduled time must be in the future");
            return;
          }

          try {
            await NotificationService().scheduleNotification(
              id: 1,
              title: 'Hatırlatma',
              body: '5 saniye sonra tetiklenen bildirim.',
              scheduledTime: scheduledTime,
              payload: 'target_page',
            );
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Bildirim ayarlandı.')));
          } catch (e) {
            print('Bildirim hatası: $e');
          }
        },
        child: Icon(Icons.notification_add, color: ColorManager.instance.grey3),
      ),

      bottomNavigationBar: NavigateBottomBar(),
      appBar: CustomAppBarTitle(
        title: Text(
          LocaleKeys.appBar_bookListAppBar.tr(),
          style: getBoldPrimaryStyleTitle(),
        ),
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<BookListCubit, BookListState>(
              builder: (context, state) {
                return ConstantSearchBar(
                  searchTextController: _searchController,
                  onChanged: (val) {
                    _bookListCubit.clear();
                    context.read<BookListCubit>().searchBookNamed(query: val);
                  },
                );
              },
            ),
            SizedBox(height: AppSizeHeight.s16),
            BlocBuilder<BookListCubit, BookListState>(
              builder: (context, state) {
                if (state is BookListLoading) {
                  return BookLoading();
                } else if (state is BookListDisplay) {
                  if (state.bookModel.data!.isEmpty) {
                    return BasicInfoCard(
                      firstDescription: "Sonuç Bulunamadı",
                      secondDescription:
                          "Aradığınız kriterlere uygun kitap bulunamadı.",
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.bookModel.data!.length,
                        itemBuilder: (context, index) {
                          final book = state.bookModel.data![index];
                          bool isFavorite = favorites.any(
                            (fav) => fav.id == book.id,
                          );
                          final bookID = book.id;
                          return CustomListTileCard(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => BookDetailsScreen(
                                        bookID: bookID ?? 0,
                                      ),
                                ),
                              );
                            },
                            title: state.bookModel.data![index].title ?? "-",
                            leading: Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: 5,
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  ImagePathManager.instance.bookImage,
                                ),
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            subTitle: Text(
                              state.bookModel.data![index].publisher ?? "-",
                            ),
                            visualDensity: VisualDensity.compact,
                            trailing: Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                vertical: 5,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: ColorManager.instance.primary,
                                    ),
                                    onPressed: () async {
                                      final favoriteBook =
                                          book.toFavoriteBookModel();

                                      context
                                          .read<FavoriteBooksCubit>()
                                          .addToFavorites(favoriteBook);

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            elevation: 5,
                                            backgroundColor: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.favorite,
                                                    color:
                                                        ColorManager
                                                            .instance
                                                            .primary,
                                                    size: 40,
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text(
                                                    'Favorilerinize Eklendi!',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          ColorManager
                                                              .instance
                                                              .black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Kitap favorilerinize başarıyla eklendi.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                          ColorManager
                                                              .instance
                                                              .primary,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                    style:
                                                        ElevatedButton.styleFrom(
                                                          iconColor:
                                                              ColorManager
                                                                  .instance
                                                                  .primary,
                                                        ),
                                                    child: Text(
                                                      'Tamam',
                                                      style:
                                                          getBoldBlackStyle(),
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
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                } else if (state is BookListError) {
                  return BasicInfoCard(
                    firstDescription: state.title,
                    secondDescription: state.description,
                  );
                } else {
                  return BasicInfoCard(
                    firstDescription: "Bulunamadı",
                    secondDescription: "Bir hata oluştu",
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

mixin _PageProperties {
  late BookListCubit _bookListCubit;
  List<FavoriteBookModel> favorites = [];
}
