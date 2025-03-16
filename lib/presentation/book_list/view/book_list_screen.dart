import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/app/notification/notification_manager.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_cubit.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_state.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/image_path_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
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

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    context.read<BookListCubit>().getBookList();
    super.initState();
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
            _buildSearchBars(),
            const SizedBox(height: 16),
            BlocBuilder<BookListCubit, BookListState>(
              builder: (context, state) {
                if (state is BookListLoading) {
                  return BookLoading();
                } else if (state is BookListDisplay) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.bookModel.data!.length,
                      itemBuilder: (context, index) {
                        return CustomListTileCard(
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
                                    // Örneğin, bir state değişikliği ya da favori listesi eklenebilir
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
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
      onChanged: (p0) {},
    );
  }
}
