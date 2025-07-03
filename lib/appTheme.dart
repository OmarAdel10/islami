import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFE2BE7F);
  static const Color black = Color(0xFF202020);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: black,

    appBarTheme: AppBarTheme(
      backgroundColor: black,
      titleTextStyle: TextStyle(
        color: primary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),

    textTheme: TextTheme(
      headlineSmall: TextStyle(
        color: primary,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),

      titleLarge: TextStyle(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),

      titleMedium: TextStyle(
        color: primary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),

      titleSmall: TextStyle(
        color: white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
