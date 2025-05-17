import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/text_styles.dart';

class CustomDateOrTimeRow extends StatelessWidget {
  const CustomDateOrTimeRow({
    super.key,
    required this.chooseDate,
    required this.chooseTime,
    required this.dateText,
    required this.timeText,
  });

  final void Function() chooseDate;
  final void Function() chooseTime;
  final String dateText;
  final String timeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 10.w,
          children: [
            Icon(Icons.date_range_outlined),
            Text(
              AppStrings.eventDate.tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Spacer(),
            TextButton(
              onPressed: chooseDate,
              child: Text(dateText.tr(), style: TextStyles.medium16Primary),
            ),
          ],
        ),
        Row(
          spacing: 10.w,
          children: [
            Icon(Icons.access_time),
            Text(
              AppStrings.eventTime.tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Spacer(),
            TextButton(
              onPressed: chooseTime,
              child: Text(timeText.tr(), style: TextStyles.medium16Primary),
            ),
          ],
        ),
      ],
    );
  }
}
