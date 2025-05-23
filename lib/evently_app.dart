import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/features/add_event/presentation/pages/add_event.dart';
import 'package:evently_app/features/add_event/presentation/pages/pick_event_location.dart';
import 'package:evently_app/features/auth/presentation/pages/forget_pass.dart';
import 'package:evently_app/features/auth/presentation/pages/login_screen.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'features/auth/presentation/pages/register.dart';
import 'features/main_screen/main_screen.dart';
import 'features/onboarding_screen/screen/onboarding_screen.dart';
import 'features/start_screen/screen/start_screen.dart';
import 'features/tabs/manager/events_provider.dart';

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
            AppRoutes.homeScreen:
                (_) =>
                ChangeNotifierProvider(
                  create: (context) =>
                  UserProvider()
                    ..getUser(),
                  child: MultiProvider(
                    providers: [
                      ChangeNotifierProvider(create: (context) =>
                      UserProvider()
                        ..getUser()),
                      ChangeNotifierProvider(create: (_) => EventsProvider()),
                    ],
                    child: const MainScreen(),
                  ),
                ),
            AppRoutes.login: (_) => const LoginScreen(),
            AppRoutes.register: (_) => const RegisterScreen(),
            AppRoutes.forgetPassword: (_) => ForgetPassword(),
            AppRoutes.addEvent: (_) => const AddEventScreen(),
            AppRoutes.pickEventLocation: (_) =>
                ChangeNotifierProvider(
                    create: (context) =>
                    EventsProvider()
                      ..getLocation(),
                    child: const PickEventLocation()),
          },
          initialRoute:
              FirebaseAuth.instance.currentUser == null
                  ? AppRoutes.login
                  : AppRoutes.homeScreen,
        );
      },
    );
  }
}
