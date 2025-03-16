import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/presentation/language_change/view_model/langueage_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this.pref) : super(LanguageInitial()) {
    switch (pref.getString("language")) {
      case "tr":
        emit(LanguageTurkish());
        break;
      case "en":
        emit(LanguageEnglish());
        break;
      default:
        emit(LanguageTurkish());
    }
  }
  late final SharedPreferences pref;
  bool currentChoose = false;
  void changeLanguage(BuildContext context, bool isEnglish) {
  final locale = isEnglish ? const Locale('en') : const Locale('tr');
  pref.setString("language", locale.languageCode);
  emit(isEnglish ? LanguageEnglish() : LanguageTurkish());
  // EasyLocalization dilini ayarla
  EasyLocalization.of(context)?.setLocale(locale);
}

  // void changeLanguage(bool en) {
  //   _changeCurrentChoose();
  //   switch (en) {
  //     case false:
  //       pref.setString("language", "tr");
  //       emit(LanguageTurkish());
  //       break;
  //     case true:
  //       pref.setString("language", "en");
  //       emit(LanguageEnglish());
  //       break;
  //       default:
  //   }
  // }

  

  void _changeCurrentChoose() {
    currentChoose = !currentChoose;
  }
}
