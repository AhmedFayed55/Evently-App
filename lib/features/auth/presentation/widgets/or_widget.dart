import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            indent: 32,
            thickness: 2,
            endIndent: 20,
            color: AppColors.primaryLight,
          ),
        ),
        Text(AppStrings.or.tr(), style: TextStyles.medium16Primary),
        const Expanded(
          child: Divider(
            thickness: 2,
            indent: 20,
            endIndent: 32,
            color: AppColors.primaryLight,
          ),
        ),
      ],
    );
  }
}
