import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryLight,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.white
        ),
        unselectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.white
        ),
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.white
    ),
    fontFamily: "Inter",
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightSecondary,
      tertiary: AppColors.lightTeritary,
      onPrimaryContainer: AppColors.darkSecondary,
      onSecondary: AppColors.grey,
      outline: AppColors.white, // for login with google background
        onPrimary: AppColors.white,
        // for selected label in tabs
        onPrimaryFixed: AppColors.primaryLight //for tab bar item svg color
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
      bodySmall: TextStyle(
        // for tabs selected label
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryLight
      ),
      titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.black
      ),
      bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.black
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDark,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.white,
      selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.white
      ),
      unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.white
      ),
    ),
    fontFamily: "Inter",
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: ColorScheme.dark(
        primary: AppColors.primaryDark,
      secondary: AppColors.darkSecondary,
      tertiary: AppColors.darkTeritary,
      onPrimaryContainer: AppColors.lightSecondary,
      onSecondary: AppColors.primaryLight,
        outline: AppColors.primaryDark,
        // for login with google background
        onPrimary: AppColors.primaryLight,
        // for selected label in tabs
        onPrimaryFixed: AppColors.white //for tab bar item svg color
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
          color: AppColors.primaryLight
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
      bodySmall: TextStyle(
        // for tabs selected label
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.white
      ),
      titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.white
      ),
      bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.white
      ),
    ),
  );
}
