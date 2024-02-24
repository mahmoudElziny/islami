import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryLight = Color(0xFFB7935F);
  static Color primaryDark = Color(0xFF141A2E);
  static Color black = Color(0xFF242424);
  static Color white = Colors.white;
  static Color gold = Color(0xFFFACC1D);

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
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryDark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
    inputDecorationTheme: InputDecorationTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryDark,
      selectedItemColor: gold,
      unselectedItemColor: white,
    ),
    textTheme: TextTheme(
      headlineSmall:
          TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: white),
      bodyMedium:
          TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: gold),
    ),
  );
}
