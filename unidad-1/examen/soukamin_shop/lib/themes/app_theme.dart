import 'package:flutter/material.dart';
import 'package:soukamin_shop/themes/text_h1.dart';

class AppTheme {
  static const colorPrimary = Colors.orange;
  static const colorSecondary = Colors.blue;
  static const fondo = Color.fromARGB(255, 255, 255, 255);

  static ThemeData get themeData {
    return ThemeData(
      primaryColor: colorPrimary,
      scaffoldBackgroundColor: fondo,
      appBarTheme: const AppBarTheme(
        backgroundColor: colorPrimary,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorPrimary,
          foregroundColor: Colors.white,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorSecondary),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: colorPrimary,
        contentTextStyle: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: colorPrimary,
        selectedIconTheme: IconThemeData(color: colorSecondary),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: colorSecondary,
        unselectedItemColor: Colors.white,
      ),
    );
  }

  static final TextStyle textH1 = textH1Theme;
}
