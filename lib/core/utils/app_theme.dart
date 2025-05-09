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
      onSecondary: AppColors.grey,
      outline: AppColors.white, // for login with google background
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.black
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(
          color: AppColors.primaryLight
      ),
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
      labelSmall: TextStyle(
        // text form field hint text
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.grey,
      ),
      displaySmall: TextStyle(
        // for text rich
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
      labelMedium: TextStyle(
        // login with google text color
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryLight
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
      onSecondary: AppColors.primaryLight,
      outline: AppColors.primaryDark, // for login with google background
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryLight
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(
          color: AppColors.primaryDark
      ),
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
      labelSmall: TextStyle(
        // text form field hint text
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      displaySmall: TextStyle(
        // for text rich
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      labelMedium: TextStyle(
        // login with google text color
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.white
      ),
    ),
  );
}
