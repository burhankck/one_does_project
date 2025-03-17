import 'package:flutter/material.dart';

class AppThemes {
  
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color.fromARGB(
      255,
      235,
      229,
      229,
    ), 
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(
        255,
        133,
        129,
        129,
      ), 
    ),
    primaryColor: Colors.grey,
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF6200EE), // Ana renk
      onPrimary: Colors.white,
      secondary: Color(0xFF03DAC6),
      onSecondary: Colors.black,
      surface: Color(0xFF2C2C2C),
      onSurface: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    primaryColor: Colors.blue,
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.orange,
      onSecondary: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.white,
    ),
  );
}
