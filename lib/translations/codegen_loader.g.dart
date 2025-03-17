// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "appBar": {
    "bookListAppBar": "Book List",
    "favorite": "My Favorites",
    "detail_book": "Book Details"
  },
  "drawer": {
    "themeChange": "Change Theme",
    "languageChange": "Change Language",
    "settings": "Settings",
    "turkish": "Turkish",
    "english": "English",
    "lightTheme": "Light Theme",
    "darkTheme": "Dark Theme"
  },
  "textField": {
    "search": "Search"
  },
  "responseMessage": {
    "success": "Operation successful",
    "noContent": "No content",
    "badRequest": "Bad request",
    "forbidden": "Access forbidden",
    "unauthorised": "Unauthorized access",
    "notFound": "Resource not found",
    "internalServerError": "Internal server error",
    "unknown": "Unknown error",
    "noInternetConnection": "No internet connection"
  },
  "responseCode": {
    "unknown": "Unknown error",
    "noInternetConnection": "No internet connection"
  },
  "text": {
    "book_List": "Book List",
    "book_body": "You can view your books",
    "not_Found_title": "No Results Found",
    "not_Found_desc": "No books matching your search criteria.",
    "favorite_add": "Added to Favorites!",
    "favorite_sucess_add": "Book successfully added to your favorites.",
    "ok": "Okay",
    "not_founds_title": "Not Found",
    "not_founds_des": "An error occurred",
    "favorite_remove": "Removed from Favorites!",
    "favorite_succes_remove": "Book successfully removed from your favorites",
    "no_favorite_found_title": "No Favorite Found",
    "no_favorite_found_desc": "No books added to favorites",
    "home_page": "Home Page",
    "my_favorite": "My Favorite"
  }
};
static const Map<String,dynamic> _tr = {
  "appBar": {
    "bookListAppBar": "Kitap Listesi",
    "favorite": "Favorilerim",
    "detail_book": "Kitap Detayları"
  },
  "drawer": {
    "themeChange": "Tema Değiştir",
    "languageChange": "Dili Değiştir",
    "settings": "Ayarlar",
    "turkish": "Türkçe",
    "english": "İngilizce",
    "lightTheme": "Açık Tema",
    "darkTheme": "Koyu Tema"
  },
  "textField": {
    "search": "Arama Yapınız"
  },
  "responseMessage": {
    "success": "İşlem başarılı",
    "noContent": "İçerik yok",
    "badRequest": "Hatalı istek",
    "forbidden": "Erişim reddedildi",
    "unauthorised": "Yetkisiz erişim",
    "notFound": "Kaynak bulunamadı",
    "internalServerError": "Sunucu hatası",
    "unknown": "Bilinmeyen hata",
    "noInternetConnection": "İnternet bağlantısı yok"
  },
  "responseCode": {
    "unknown": "Bilinmeyen hata",
    "noInternetConnection": "İnternet bağlantısı yok"
  },
  "text": {
    "book_List": "Kitap Listesi",
    "book_body": "Kitaplarınızı görüntüleyebilirsiniz",
    "not_Found_title": "Sonuç Bulunamadı",
    "not_Found_desc": "Aradığınız kriterlere uygun kitap bulunamadı.",
    "favorite_add": "Favorilerinize Eklendi!",
    "favorite_sucess_add": "Kitap favorilerinize başarıyla eklendi.",
    "ok": "Tamam",
    "not_founds_title": "Bulunamadı",
    "not_founds_des": "Bir hata oluştu",
    "favorite_remove": "Favorilerinizden Çıkarıldı!",
    "favorite_succes_remove": "Kitap favorilerinizden başarıyla çıkarıldı",
    "no_favorite_found_title": "Favori Bulunamadı",
    "no_favorite_found_desc": "Favoriye eklenen kitap bulunamadı",
    "home_page": "AnaSayfa",
    "my_favorite": "Favorilerim"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "tr": _tr};
}
