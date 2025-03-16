import 'package:hive/hive.dart';

part 'favorite_book_model.g.dart'; 

@HiveType(typeId: 1)
class FavoriteBookModel {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? handle;

  @HiveField(3)
  final String? publisher;

  FavoriteBookModel({this.id, this.title, this.handle, this.publisher});
}
