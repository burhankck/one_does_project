import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/data/model/book_model.dart';
import 'package:one_does_project/data/repository/book_repository.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_state.dart';
import 'package:one_does_project/presentation/resources/utils.dart';

class BookListCubit extends Cubit<BookListState> with _CubitProperties {
  BookListCubit() : super(BookListInitial());

  Future<void> getBookList() async {
    emit(BookListLoading());
    await _bookListRepository
        .getBookListRepository()
        .then((bookData) {
          if (bookData != null && bookData.data != null) {
            emit(BookListDisplay(bookModel: bookData));
          } else {
            emit(
              BookListError(
                title: "Bulunamadı",
                description: "Kitap listesi bulunamadı",
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          List<String> splittedList = Utils.errorCatching(error);
          emit(
            BookListError(
              title: splittedList.first,
              description: splittedList.last,
            ),
          );
        });
  }

 

  void searchBookNamed({required String query}) {
    if (query.isEmpty) {
      emit(BookListDisplay(bookModel: BookModel(data: allList)));
    } else {
      tempList =
          allList.where((books) {
            return books.title != null &&
                    books.title!.toLowerCase().contains(query.toLowerCase()) ||
                books.publisher != null &&
                    books.publisher!.toLowerCase().contains(
                      query.toLowerCase(),
                    );
          }).toList();

      if (tempList.isNotEmpty) {
        emit(BookListDisplay(bookModel: BookModel(data: tempList)));
      } else {
        emit(
          BookListDisplay(
            bookModel: BookModel(data: tempList),
            isSearchNotFound: true,
          ),
        );
      }
    }
  }

  void clear() {
    allList;
    tempList;
  }
}

mixin _CubitProperties {
  final BookRepository _bookListRepository = BookRepository();
  List<Datum> allList = [];
  List<Datum> tempList = [];
}
