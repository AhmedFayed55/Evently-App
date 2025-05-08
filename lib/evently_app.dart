import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/features/home/home_screen.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'features/onboarding_screen/screen/onboarding_screen.dart';
import 'features/start_screen/screen/start_screen.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key, required this.routeName});

  final String routeName;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          themeMode: themeProvider.currentTheme,
          routes: {
            AppRoutes.startScreen: (_) => const StartScreen(),
            AppRoutes.onboardingScreen: (_) => const OnboardingScreen(),
            AppRoutes.homeScreen: (_) => const HomeScreen(),
          },
          initialRoute: routeName,
        );
      },
    );
  }
}
