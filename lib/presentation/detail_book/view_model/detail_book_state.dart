import 'package:one_does_project/data/model/book_detail_model.dart';

abstract class BookDetailState {}

class BookDetailInitial extends BookDetailState {}

class BookDetailLoading extends BookDetailState {}

class BookDetailDisplay extends BookDetailState {
  final BookDetailModel bookModel;

  BookDetailDisplay({required this.bookModel});
}

class BookDetailError extends BookDetailState {
  final String title;
  final String description;

  BookDetailError({required this.title, required this.description});
}
