import 'package:flutter/material.dart';

import '../core/helpers/shared_prefrence.dart';
import '../core/utils/app_strings.dart';

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
