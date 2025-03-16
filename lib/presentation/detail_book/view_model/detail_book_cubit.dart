import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/data/repository/book_repository.dart';
import 'package:one_does_project/presentation/detail_book/view_model/detail_book_state.dart';
import 'package:one_does_project/presentation/resources/utils.dart';

class BookDetailCubit extends Cubit<BookDetailState> with _CubitProperties {
  BookDetailCubit() : super(BookDetailInitial());

  Future<void> getBookDetail({required int booksID}) async {
    emit(BookDetailLoading());
    await _bookDetailRepository
        .getBookDetailRepository(bookID: booksID)
        .then((responseVal) {
          if (responseVal != null && responseVal.data != null) {
            emit(BookDetailDisplay(bookModel: responseVal));
          } else {
            BookDetailError(
              title: "Bulunamadı",
              description: "Bir hata oluştu",
            );
          }
        })
        .onError((error, stackTrace) {
          List<String> splittedList = Utils.errorCatching(error);
          emit(
            BookDetailError(
              title: splittedList.first,
              description: splittedList.last,
            ),
          );
        });
  }
}

mixin _CubitProperties {
  final BookRepository _bookDetailRepository = BookRepository();
}
