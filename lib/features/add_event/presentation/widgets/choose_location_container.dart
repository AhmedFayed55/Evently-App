import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/text_styles.dart';

class ChooseLocationContainer extends StatelessWidget {
  const ChooseLocationContainer(
      {super.key, required this.chooseLocation, required this.text});

  final void Function() chooseLocation;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text(
          AppStrings.location.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        InkWell(
          onTap: chooseLocation,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primaryLight, width: 1.5),
            ),
            child: Row(
              spacing: 8.w,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SvgPicture.asset(AppImages.gpsSvg),
                ),
                Flexible(
                  child: Text(
                    text,
                    style: TextStyles.medium16Primary,
                    overflow: TextOverflow.clip,
                  ),
                ),
                Spacer(),
                Icon(Icons.keyboard_arrow_right, color: AppColors.primaryLight),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
