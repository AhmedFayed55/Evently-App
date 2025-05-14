import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/tabs/user_tab/widgets/language_bottom_sheet.dart';
import 'package:evently_app/features/tabs/user_tab/widgets/logout_button.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/dialogue_utils.dart';
import '../../../../core/utils/app_routes.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_user_app_bar_title.dart';
import '../widgets/theme_bottom_sheet.dart';

class UserTab extends StatefulWidget {
  const UserTab({super.key});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
        ),
        backgroundColor: AppColors.primaryLight,
        toolbarHeight: 150.h,
        title: CustomUserTabAppBarTitle(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          spacing: 16.h,
          children: [
            CustomDropdown(
              onTap: showLanguageBottomSheet,
              label: AppStrings.language,
              value: context.locale.languageCode == "en" ? AppStrings.english
                  : AppStrings.arabic,
            ),
            CustomDropdown(
                onTap: showThemeBottomSheet,
                label: AppStrings.theme,
                value: themeProvider.currentTheme == ThemeMode.light
                    ? AppStrings.light
                    : AppStrings.dark),
            Spacer(),
            LogoutButton(onPressed: onLogoutClick,),
          ],
        ),
      ),
    );
  }

  void onLogoutClick() {
    DialogueUtils.showMessage(
        context: context,
        message: AppStrings.logOutOfYourAccount.tr(),
        posActionName: AppStrings.cancel.tr(),
        ngeActionName: AppStrings.logout.tr(),
        ngeAction: () {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.login, (route) => false);
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      context: context, builder: (context) => ThemeBottomSheet(),);
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      context: context, builder: (context) => LanguageBottomSheet(),);
  }
}







