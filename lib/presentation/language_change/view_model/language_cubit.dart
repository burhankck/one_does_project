import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_does_project/presentation/language_change/view_model/langueage_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final SharedPreferences pref;
  String currentChoose = "";

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

  void changeLanguage(bool en) {
    _changeCurrentChoose(en);
    switch (en) {
      case false:
        pref.setString("language", "tr");
        emit(LanguageTurkish());
        break;
      case true:
        pref.setString("language", "en");
        emit(LanguageEnglish());
        break;
      default:
    }
  }

  void _changeCurrentChoose(bool en) {
    if (en) {
      currentChoose = 'en';  // İngilizce dil seçimi
    } else {
      currentChoose = 'tr';  // Türkçe dil seçimi
    }
  }
}

