import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/text_styles.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.forgetPassword);
        },
        child: Text(
          AppStrings.forgetPassword.tr(),
          style: TextStyles.bold16Primary.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryLight,
          ),
        ),
      ),
    );
  }
}
