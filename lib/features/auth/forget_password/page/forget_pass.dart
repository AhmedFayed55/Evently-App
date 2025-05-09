import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/re_useable_widgets/CustomButton.dart';
import 'package:evently_app/core/re_useable_widgets/custom_text_form_field.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.forgetPassword.tr())),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24.h,
            children: [
              Image.asset(AppImages.forgetPass),
              CustomTextFormField(
                hintText: AppStrings.email.tr(),
                prefixIconImage: AppImages.emailSvg,
              ),
              CustomButton(
                title: AppStrings.resetPassword.tr(),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
