import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../providers/user_provider.dart';

class HomeTabCustomAppBar extends StatelessWidget {
  const HomeTabCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Container(
      height: 115.h,
      padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 24.h),
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        spacing: 8.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${AppStrings.welcomeBack.tr()} ✨",
                      style: TextStyles.regular14White),
                  provider.isLoading
                      ? CircularProgressIndicator(color: AppColors.white)
                      : Text(
                        provider.user?.name ?? "No Name",
                        style: TextStyles.bold24White,
                      ),
                ],
              ),
              Row(
                spacing: 8.w,
                children: [
                  Icon(Icons.light_mode_outlined, color: AppColors.white),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      context.locale.languageCode == "ar" ? "AR" : "EN",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(AppImages.mapUnselected),
              Text("Cairo, Egypt", style: TextStyles.medium14White),
            ],
          ),
        ],
      ),
    );
  }
}
