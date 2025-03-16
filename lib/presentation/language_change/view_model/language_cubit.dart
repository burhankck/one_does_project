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
  void changeLanguage(bool en) {
    _changeCurrentChoose();
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

  void _changeCurrentChoose() {
    currentChoose = !currentChoose;
  }
}
