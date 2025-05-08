import 'package:evently_app/core/utils/text_styles.dart';
import 'package:evently_app/features/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.model});

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        spacing: 38.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(model.image),
          Text(
            model.title,
            style: TextStyles.bold20Primary.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(model.subtitle, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
