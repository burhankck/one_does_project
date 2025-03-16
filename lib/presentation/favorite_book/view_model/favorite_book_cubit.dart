import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:one_does_project/data/model/favorite_book_model.dart';
import 'package:one_does_project/presentation/favorite_book/view_model/favorite_book_state.dart';

class FavoriteBooksCubit extends Cubit<FavoriteBookState> {
  FavoriteBooksCubit() : super(FavoriteBookInitial());

  Future<void> loadFavorites() async {
    emit(FavoriteBookLoading());
    try {
      var favorites = await getFavorites();
      emit(FavoriteBookDisplay(favorites)); 
    } catch (e) {
      emit(FavoriteBookError(
          title: "Hata", description: "Favorileri yüklerken bir hata oluştu"));
    }
  }

  Future<void> addToFavorites(FavoriteBookModel book) async {
    emit(FavoriteBookLoading());
    try {
      var box = await Hive.openBox<FavoriteBookModel>('favoritesBox');
      await box.add(book);
      await loadFavorites();
    } catch (e) {
      emit(FavoriteBookError(
          title: "Hata", description: "Favorileri eklerken bir hata oluştu"));
    }
  }

  Future<void> removeFromFavorites(FavoriteBookModel book) async {
    emit(FavoriteBookLoading());
    try {
      var box = await Hive.openBox<FavoriteBookModel>('favoritesBox');

      var keyToRemove = box.keys.firstWhere(
        (key) => box.get(key)?.id == book.id,
        orElse: () => null,
      );

      if (keyToRemove != null) {
        await box.delete(keyToRemove);
      }

      
      await loadFavorites();
    } catch (e) {
      emit(FavoriteBookError(
          title: "Hata",
          description: "Favorileri kaldırırken bir hata oluştu"));
    }
  }

  Future<List<FavoriteBookModel>> getFavorites() async {
    var box = await Hive.openBox<FavoriteBookModel>('favoritesBox');
    return box.values.toList();
  }
}

