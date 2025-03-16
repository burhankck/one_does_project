import 'package:hive/hive.dart';
import 'package:one_does_project/data/model/favorite_book_model.dart';

class FavoriteBookRepository {
  Future<void> addToFavorites(FavoriteBookModel book) async {
    var box = await Hive.openBox<FavoriteBookModel>('favoritesBox');
    await box.add(book);
  }

  Future<List<FavoriteBookModel>> getFavorites() async {
    var box = await Hive.openBox<FavoriteBookModel>('favoritesBox');
    return box.values.toList();
  }
}

