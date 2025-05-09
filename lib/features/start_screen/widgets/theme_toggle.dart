import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/helpers/shared_prefrence.dart';
import '../../../core/utils/app_images.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    int currentValue = themeProvider.currentTheme == ThemeMode.light ? 0 : 1;
    return AnimatedToggleSwitch<int>.rolling(
      current: currentValue,
      values: [0, 1],
      onChanged: (newValue) {
        setState(() {
          currentValue = newValue;
          if (currentValue == 0) {
            themeProvider.changeThemeMode(ThemeMode.light);
            SharedPreferenceUtils.saveData(
                key: AppStrings.currentThemeMode, value: ThemeMode.light);
          } else {
            themeProvider.changeThemeMode(ThemeMode.dark);
            SharedPreferenceUtils.saveData(
                key: AppStrings.currentThemeMode, value: ThemeMode.dark);
          }
        });
      },

      iconOpacity: 1,
      style: ToggleStyle(
        borderColor: Theme.of(context).colorScheme.primary,
        indicatorColor: Theme.of(context).colorScheme.primary,
      ),
      iconList: [
        SvgPicture.asset(
          AppImages.sunIcon,
          height: 30,
          width: 30,
          colorFilter: ColorFilter.mode(
            currentValue == 0
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : Theme.of(context).colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
        SvgPicture.asset(
          AppImages.moonIcon,
          height: 30,
          width: 30,
          colorFilter: ColorFilter.mode(
            currentValue == 1
                ? Theme.of(context).colorScheme.onPrimaryContainer
                : Theme.of(context).colorScheme.primary,
            BlendMode.srcIn,
          ),
        ),
      ],
    );
  }
}
