import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../providers/theme_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
      height: 200.h,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              // todo: change Theme to Light
              themeProvider.changeThemeMode(ThemeMode.light);
              // todo: pop to hide bottom sheet
              Navigator.pop(context);
            },
            child:
                themeProvider.currentTheme == ThemeMode.light
                    ? getSelectedItemWidget(AppStrings.light.tr())
                    : getUnSelectedItemWidget(AppStrings.light.tr()),
          ),
          InkWell(
            onTap: () {
              // todo: change Theme to Dark
              themeProvider.changeThemeMode(ThemeMode.dark);
              // todo: pop to hide bottom sheet
              Navigator.pop(context);
            },
            child:
                themeProvider.currentTheme == ThemeMode.dark
                    ? getSelectedItemWidget(AppStrings.dark.tr())
                    : getUnSelectedItemWidget(AppStrings.dark.tr()),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyles.bold20Primary),
        Icon(Icons.check, color: AppColors.primaryLight, size: 30),
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(text, style: TextStyles.bold20Black);
  }
}
