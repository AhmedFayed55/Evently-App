import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/text_styles.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.red,
        minimumSize: Size(double.infinity, 56.h),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          Icon(Icons.logout, color: AppColors.white, size: 23),
          Text(AppStrings.logout.tr(), style: TextStyles.regular20white),
        ],
      ),
    );
  }
}
