import 'package:flutter/material.dart';

class appTheme {
  static bool isDark = false;
  static Color dark_primary = Color(0xff141A2E);
  static Color dark_secondary = Color(0xffFACC1D);
  static Color light_primary = Color(0xffB7935F);
  static ThemeData light_theme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    cardTheme: CardTheme(color: Colors.white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 30, color: Colors.black),
      unselectedIconTheme: IconThemeData(size: 20),
      selectedItemColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: light_primary,
      primary: light_primary,
      onPrimary: Colors.white,
      secondary: Color(0xffB7935F).withOpacity(0.57),
      onSecondary: Colors.black, //text is suares and ahadeth
      tertiary: Colors.black, //text is suares_widegt and ahadeth_widget
      onTertiary: light_primary, //sebha
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold), //unselected
      bodyMedium: TextStyle(
          color: light_primary,
          fontSize: 30,
          fontWeight: FontWeight.bold), //selected
    ),
    cardColor: Colors.white,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
    useMaterial3: true,
  );

  static ThemeData dark_theme = ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.transparent,
    cardTheme: CardTheme(color: dark_primary),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 28, color: Color(0xffFACC1D)),
      unselectedIconTheme: IconThemeData(size: 20),
      selectedItemColor: dark_secondary,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: dark_primary,
      primary: dark_primary,
      onPrimary: Colors.black,
      secondary: dark_secondary,
      onSecondary: dark_secondary,
      tertiary: Colors.white,
      onTertiary: dark_secondary,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold), //unselected
      bodyMedium: TextStyle(
          color: dark_secondary,
          fontSize: 30,
          fontWeight: FontWeight.bold), //selected
    ),
    cardColor: dark_primary,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: dark_primary),
    useMaterial3: true,
  );
}
