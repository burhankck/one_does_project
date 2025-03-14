// ignore_for_file: must_be_immutable



import 'package:equatable/equatable.dart' show Equatable;

abstract class LanguageState extends Equatable {
  String selectedLang = "tr";
}

class LanguageInitial extends LanguageState {
  @override
  String get selectedLang => "tr";

  @override
  List<Object?> get props => [];
}

class LanguageTurkish extends LanguageState {
  @override
  String get selectedLang => "tr";

  @override
  List<Object?> get props => [];
}

class LanguageEnglish extends LanguageState {
  @override
  String get selectedLang => "en";

  @override
  List<Object?> get props => [];
}
