import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class TabBarItemWidget extends StatelessWidget {
  const TabBarItemWidget({
    super.key,
    required this.eventName,
    required this.icon,
    required this.isSelected,
  });

  final String eventName;
  final String icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      margin: EdgeInsetsDirectional.only(end: 10.w),
      decoration: BoxDecoration(
        color:
            isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : AppColors.transparentColor,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(
          width: 1.3,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      child: Row(
        spacing: 7.w,
        children: [
          SvgPicture.asset(
            icon,
            color:
                !isSelected
                    ? AppColors.white
                    : Theme.of(context).colorScheme.onPrimaryFixed,
            width: 25,
            height: 25,
          ),
          Text(
            eventName,
            style:
                isSelected
                    ? Theme.of(context).textTheme.bodySmall
                    : TextStyles.medium16White,
          ),
        ],
      ),
    );
  }
}
