import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_cubit.dart';
import 'package:one_does_project/presentation/detail_book/view_model/detail_book_cubit.dart';
import 'package:one_does_project/presentation/detail_book/view_model/detail_book_state.dart';
import 'package:one_does_project/presentation/resources/color_manager.dart';
import 'package:one_does_project/presentation/resources/style_manager.dart';
import 'package:one_does_project/presentation/widgets/appbar_menu.dart';
import 'package:one_does_project/presentation/widgets/book_loading.dart';
import 'package:one_does_project/presentation/widgets/bottom_Navigation_Bar.dart';

class BookDetailsScreen extends StatefulWidget {
  final int bookID;
  const BookDetailsScreen({super.key, required this.bookID});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen>
    with _PageProperties {
  @override
  void initState() {
    context.read<BookDetailCubit>().getBookDetail(booksID: widget.bookID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<BookListCubit>().getBookList();
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: NavigateBottomBar(),
        appBar: CustomAppBarTitle(
          title: Text("Kitap Detayları", style: getBoldPrimaryStyleTitle()),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<BookDetailCubit, BookDetailState>(
            builder: (context, state) {
              if (state is BookDetailLoading) {
                return BookLoading();
              } else if (state is BookDetailDisplay) {
                final bookDetail = state.bookModel.data;
                return Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                        Row(
                          children: [
                            Icon(
                              Icons.book,
                              size: 30,
                              color: ColorManager.instance.primary,
                            ),
                            SizedBox(width: 8),
                            Text(
                              bookDetail?.title ?? "-",
                              style: getBoldPrimaryStyle(),
                            ),
                          ],
                        ),
                        Divider(),
                      
                        _buildInfoRow(
                          icon: Icons.business,
                          label: "Publisher",
                          value: bookDetail?.publisher ?? "-",
                        ),
                        _buildInfoRow(
                          icon: Icons.format_list_numbered,
                          label: "ISBN",
                          value: bookDetail?.isbn ?? "-",
                        ),
                        _buildInfoRow(
                          icon: Icons.tag,
                          label: "Handle",
                          value: bookDetail?.handle ?? "-",
                        ),
                        _buildInfoRow(
                          icon: Icons.date_range,
                          label: "Year",
                          value: bookDetail?.year.toString() ?? "-",
                        ),
                        _buildInfoRow(
                          icon: Icons.pages,
                          label: "Pages",
                          value: bookDetail?.pages.toString() ?? "-",
                        ),
                       
                        if (bookDetail?.villains?.isNotEmpty ?? false)
                          _buildInfoRow(
                            icon: Icons.warning,
                            label: "Villains",
                            value: bookDetail?.villains?[0].name ?? "-",
                          ),
                      
                        if (bookDetail?.notes?.isNotEmpty ?? false)
                          _buildInfoRow(
                            icon: Icons.note,
                            label: "Notes",
                            value: bookDetail?.notes?.first ?? "-",
                          ),
                      ],
                    ),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  // Bilgiler için genel row yapısı
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24, color: ColorManager.instance.primary),
          SizedBox(width: 8),
          Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontStyle: FontStyle.italic),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

mixin _PageProperties {
  late BookDetailCubit _bookDetailCubit;
}
