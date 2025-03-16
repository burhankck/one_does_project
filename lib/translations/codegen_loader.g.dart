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
    "bookListAppBar": "Book List"
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
    "forbidden": "Access denied",
    "unauthorised": "Unauthorized access",
    "notFound": "Resource not found",
    "internalServerError": "Server error",
    "unknown": "Unknown error",
    "noInternetConnection": "No internet connection"
  },
  "responseCode": {
    "unknown": "Unknown error",
    "noInternetConnection": "No internet connection"
  }
};
static const Map<String,dynamic> _tr = {
  "appBar": {
    "bookListAppBar": "Kitap Listesi"
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
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "tr": _tr};
}
