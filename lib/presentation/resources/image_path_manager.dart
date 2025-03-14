class ImagePathManager {
  static final ImagePathManager _instance = ImagePathManager._init();
  static ImagePathManager get instance => _instance;
  ImagePathManager._init();

  final String bookImage = "assets/book.png";
}
