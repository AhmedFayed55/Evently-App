import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class LocationContainer extends StatelessWidget {
  const LocationContainer({
    super.key,
    required this.region,
    required this.country,
  });

  final String region;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryLight, width: 1.5),
      ),
      child: Row(
        spacing: 8.w,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primaryLight,
            ),
            height: 48.h,
            width: 48.w,
            child: Icon(
              Icons.my_location,
              color: Theme.of(context).colorScheme.primaryFixed,
            ),
          ),
          Text("$region , $country", style: TextStyles.medium16Primary),
        ],
      ),
    );
  }
}
