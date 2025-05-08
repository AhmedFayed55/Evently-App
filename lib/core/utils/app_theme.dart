import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      tertiary: AppColors.lightTeritary,
      onPrimaryContainer: AppColors.darkSecondary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: AppColors.lightPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
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
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      tertiary: AppColors.darkTeritary,
      onPrimaryContainer: AppColors.lightSecondary,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: AppColors.darkPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
