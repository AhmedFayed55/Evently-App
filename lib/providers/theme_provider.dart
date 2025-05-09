import 'package:evently_app/core/helpers/shared_prefrence.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = SharedPreferenceUtils.getThemeMode(
    AppStrings.currentThemeMode,
  );

  void changeThemeMode(ThemeMode newThemeMode) {
    if (newThemeMode == currentTheme) {
      return;
    }
    currentTheme = newThemeMode;
    notifyListeners();
  }
}
