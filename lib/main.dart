import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/helpers/shared_prefrence.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/strings_manager.dart';
import 'evently_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPreferenceUtils.init();
  String routeName;
  var isFirstTime = SharedPreferenceUtils.getData(key: AppStrings.firstTime);
  if (isFirstTime == null) {
    routeName = AppRoutes.startScreen;
  } else {
    routeName = AppRoutes.homeScreen;
  }
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      // first time open language
      saveLocale: true,
      // default is true already but this only for clarity
      child: ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: EventlyApp(routeName: routeName,))));
}


