import 'package:flutter/material.dart';

import 'color_manager.dart';

class AppStyle {
  static bool isDark = false;
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: ColorManager.background,
    colorScheme: ColorScheme.light(
      primary: ColorManager.lightPrimary,
      secondary: ColorManager.lightSecondary,
      tertiary: ColorManager.lightTeritary,
      onPrimaryContainer: ColorManager.darkSecondary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: ColorManager.lightPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorManager.lightSecondary,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: ColorManager.backgroundDark,
    colorScheme: ColorScheme.dark(
      primary: ColorManager.darkPrimary,
      secondary: ColorManager.darkSecondary,
      tertiary: ColorManager.darkTeritary,
      onPrimaryContainer: ColorManager.lightSecondary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: ColorManager.darkPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorManager.darkSecondary,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
