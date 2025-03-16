import 'package:one_does_project/data/model/book_model.dart';

abstract class BookListState {}

class BookListInitial extends BookListState {}

class BookListLoading extends BookListState {}

class BookListDisplay extends BookListState {
  final BookModel bookModel;

  BookListDisplay({required this.bookModel});
}

class BookListError extends BookListState {
  final String title;
  final String description;

  BookListError({required this.title, required this.description});
}
