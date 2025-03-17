// ignore_for_file: must_be_immutable



import 'package:equatable/equatable.dart' show Equatable;

abstract class LanguageState extends Equatable {
  final String selectedLang;
  const LanguageState(this.selectedLang);  // selectedLang'i constructor ile alıyoruz.
}

class LanguageInitial extends LanguageState {
  const LanguageInitial() : super("tr");  // Varsayılan olarak 'tr' dilini gönderiyoruz.
  
  @override
  List<Object?> get props => [selectedLang];  // selectedLang'i props içine alıyoruz.
}

class LanguageTurkish extends LanguageState {
  const LanguageTurkish() : super("tr");
  
  @override
  List<Object?> get props => [selectedLang];
}

class LanguageEnglish extends LanguageState {
  const LanguageEnglish() : super("en");
  
  @override
  List<Object?> get props => [selectedLang];
}
