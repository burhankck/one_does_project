import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/app/notification/notification_manager.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_cubit.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_state.dart';
import 'package:one_does_project/presentation/detail_book/view/detail_book_screen.dart';
import 'package:one_does_project/presentation/detail_book/view_model/detail_book_cubit.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
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

  @override
  void initState() {
    _initCubit();
    context.read<BookListCubit>().getBookList();
    super.initState();
  }

  void _initCubit() {
    _bookListCubit = context.read<BookListCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final now = DateTime.now();
          final scheduledTime = now.add(Duration(seconds: 5));

          NotificationService().scheduleNotification(
            id: 1,
            title: 'Hatırlatma',
            body: '10 saniye sonra tetiklenen bildirim.',
            scheduledTime: scheduledTime,
            payload: 'target_page',
          );

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Bildirim ayarlandı.')));
        },
        child: Icon(Icons.add),
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
                                      Icons.favorite_border,
                                      color: ColorManager.instance.primary,
                                    ),
                                    onPressed: () {
                                      // Favori ekleme işlemi yapılabilir
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

  ConstantSearchBar _buildSearchBars() {
    return ConstantSearchBar(
      searchTextController: _searchController,
      onChanged: (val) {
        _bookListCubit.searchBookNamed(query: val);
      },
    );
  }
}

mixin _PageProperties {
  late BookListCubit _bookListCubit;
}
