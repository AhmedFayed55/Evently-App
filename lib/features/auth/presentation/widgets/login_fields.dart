import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/re_useable_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({
    super.key,
    required this.emailController,
    required this.passController,
  });

  final TextEditingController emailController;
  final TextEditingController passController;

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        CustomTextFormField(
          controller: widget.emailController,
          hintText: AppStrings.email.tr(),
          prefixIconImage: AppImages.emailSvg,
        ),
        CustomTextFormField(
          isObscure: isObscure,
          controller: widget.passController,
          hintText: AppStrings.password.tr(),
          prefixIconImage: AppImages.passwordSvg,
          suffixIcon: IconButton(
            icon: Icon(
              isObscure
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppColors.grey,
            ),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
        ),
      ],
    );
  }
}
