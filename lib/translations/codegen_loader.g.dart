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
    "english": "English"
  },
  "textField": {
    "search": "Search"
  }
};
static const Map<String,dynamic> _tr = {
  "appBar": {
    "bookListAppBar": "Kitap Listesi"
  },
  "drawer": {
    "themeChange": "Tema değiştir.",
    "languageChange": "Dil değiştir",
    "settings": "Ayarlar",
    "turkish": "Türkçe",
    "english": "İngilizce"
  },
  "textField": {
    "search": "Arama Yapınız"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "tr": _tr};
}
