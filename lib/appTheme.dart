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
      centerTitle: true,
      foregroundColor: primary,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primary,
      selectedItemColor: white,
      unselectedItemColor: black,
      selectedLabelStyle: TextStyle(
        color: white,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      showUnselectedLabels: false,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: black.withValues(alpha: 0.7),

      hintStyle: TextStyle(
        color: white.withValues(alpha: 0.7),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary, width: 1),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary, width: 1),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: primary, width: 1),
      ),
    ),

    textTheme: TextTheme(
      displaySmall: TextStyle(
        color: white,
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),

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
        color: white,
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
