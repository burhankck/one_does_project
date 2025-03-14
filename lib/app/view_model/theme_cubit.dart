import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light); // Başlangıçta açık tema

  // Tema değiştirme fonksiyonu
  void toggleTheme() {
    // Geçerli durumu tersine çevirerek tema değiştir
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark); // Karanlık tema
    } else {
      emit(ThemeMode.light); // Açık tema
    }
  }
}


