import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 15.w),
      height: 200.h,
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              if (context.locale.languageCode == "ar") {
                context.setLocale(Locale("en"));
                Navigator.pop(context);
              } else {
                Navigator.pop(context);
                return;
              }
            },
            child:
                context.locale.languageCode == "en"
                    ? getSelectedItemWidget(AppStrings.english.tr())
                    : getUnSelectedItemWidget(AppStrings.english.tr()),
          ),
          InkWell(
            onTap: () {
              if (context.locale.languageCode == "en") {
                context.setLocale(Locale("ar"));
                Navigator.pop(context);
              } else {
                Navigator.pop(context);
                return;
              }
            },
            child:
                context.locale.languageCode == "ar"
                    ? getSelectedItemWidget(AppStrings.arabic.tr())
                    : getUnSelectedItemWidget(AppStrings.arabic.tr()),
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
