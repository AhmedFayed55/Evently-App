import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class EventCategoriesItemWidget extends StatelessWidget {
  const EventCategoriesItemWidget({
    super.key,
    required this.eventName,
    required this.isSelected,
    required this.icon,
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
        color: isSelected ? AppColors.primaryLight : Colors.transparent,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(width: 1.3, color: AppColors.primaryLight),
      ),
      child: Row(
        spacing: 7.w,
        children: [
          SvgPicture.asset(
            icon,

            color:
                isSelected
                    ? Theme.of(context).colorScheme.onTertiary
                    : AppColors.primaryLight,
            width: 25,
            height: 25,
          ),
          Text(
            eventName.tr(),
            style:
                isSelected
                    ? Theme.of(context).textTheme.bodyMedium
                    : TextStyles.bold16Primary,
          ),
        ],
      ),
    );
  }
}
