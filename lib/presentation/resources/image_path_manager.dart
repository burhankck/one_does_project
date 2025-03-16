class ImagePathManager {
  static final ImagePathManager _instance = ImagePathManager._init();
  static ImagePathManager get instance => _instance;
  ImagePathManager._init();

  final String bookImage = "assets/images/book.png";
  final String turkFlagImage = "assets/images/turk_flag.png";
  final String englandFlagImage = "assets/images/england_flag.png";
  final String englandFlagsImage = "assets/images/england_flags.png";
  final String turkishFlagsImage = "assets/images/turkish_flag.png";
  final String infoErrorImage = "assets/images/info_error.png";
}
