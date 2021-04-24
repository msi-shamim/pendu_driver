import 'package:flutter/material.dart';

class Pendu {
  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: Pendu.color('5BDB98'),
        accentColor: Pendu.color('1B3149'),
        inputDecorationTheme:
            InputDecorationTheme(border: OutlineInputBorder()));
  }

  static Color color(String code) {
    String finalColor = '0xFF' + code;
    return Color(int.parse(finalColor));
  }
}
