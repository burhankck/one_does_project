import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/data/repository/book_list_repository.dart';
import 'package:one_does_project/presentation/book_list/view_model/book_list_state.dart';
import 'package:one_does_project/presentation/resources/utils.dart';

class BookListCubit extends Cubit<BookListState> with _CubitProperties {
  BookListCubit() : super(BookListInitial());

  Future<void> getBookList() async {
    emit(BookListLoading());
    await _bookListRepository
        .getBookRepository()
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
}

mixin _CubitProperties {
  final BookListRepository _bookListRepository = BookListRepository();
}
