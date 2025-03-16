import 'package:one_does_project/data/model/book_model.dart';
import 'package:one_does_project/data/model/favorite_book_model.dart';

extension DatumToFavoriteBookModel on Datum {
  FavoriteBookModel toFavoriteBookModel() {
    return FavoriteBookModel(
      id: this.id,
      title: this.title,
      handle: this.handle,
      publisher: this.publisher,
    );
  }
}
