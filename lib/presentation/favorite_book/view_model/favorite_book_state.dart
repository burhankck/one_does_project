import 'package:one_does_project/data/model/favorite_book_model.dart';

abstract class FavoriteBookState {}

class FavoriteBookInitial extends FavoriteBookState {}

class FavoriteBookLoading extends FavoriteBookState {}

class FavoriteBookDisplay extends FavoriteBookState {
  final List<FavoriteBookModel> favorites;
  FavoriteBookDisplay(this.favorites);
}

class FavoriteBookError extends FavoriteBookState {
  final String title;
  final String description;

  FavoriteBookError({required this.title, required this.description});
}
