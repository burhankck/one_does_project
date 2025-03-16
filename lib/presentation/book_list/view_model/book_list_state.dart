import 'package:one_does_project/data/model/book_model.dart';

abstract class BookListState {}

class BookListInitial extends BookListState {}

class BookListLoading extends BookListState {}

class BookListDisplay extends BookListState {
  final BookModel bookModel;
  final bool isSearchNotFound;

  BookListDisplay({required this.bookModel, this.isSearchNotFound = false});
}

class BookListError extends BookListState {
  final String title;
  final String description;

  BookListError({required this.title, required this.description});
}
