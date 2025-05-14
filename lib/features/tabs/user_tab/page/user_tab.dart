import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_user_app_bar_title.dart';

class UserTab extends StatelessWidget {
  const UserTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
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
              label: AppStrings.language,
              value: AppStrings.english,
            ),
            CustomDropdown(label: AppStrings.theme, value: AppStrings.light),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 56.h),
              ),
              child: Row(
                spacing: 8.w,
                children: [
                  Icon(Icons.logout, color: AppColors.white),
                  Text(
                    AppStrings.logout.tr(),
                    style: TextStyles.regular20white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        Text(label.tr(), style: Theme.of(context).textTheme.bodyLarge),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 2, color: AppColors.primaryLight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value.tr(), style: TextStyles.bold20Primary),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.primaryLight,
                  size: 35,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
