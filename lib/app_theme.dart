import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryLight = Color(0xFFB7935F);
  static Color black = Color(0xFF242424);
  static Color white = Colors.white;
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
    inputDecorationTheme: InputDecorationTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryLight,
      selectedItemColor: black,
      unselectedItemColor: white,
    ),
    textTheme: TextTheme(
      headlineSmall:
          TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: black),
      bodyMedium:
          TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: black),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
