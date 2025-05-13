import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/validators.dart';
import '../../../../core/re_useable_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passController,
    required this.rePassController,
  });

  final TextEditingController nameController;

  final TextEditingController emailController;

  final TextEditingController passController;

  final TextEditingController rePassController;

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  bool isObscure = true;

  bool isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.h,
      children: [
        CustomTextFormField(
          hintText: AppStrings.name.tr(),
          controller: widget.nameController,
          prefixIconImage: AppImages.nameSvg,
        ),
        CustomTextFormField(
          validator: (val) {
            return AppValidators.validateEmail(val);
          },
          hintText: AppStrings.email.tr(),
          controller: widget.emailController,
          prefixIconImage: AppImages.emailSvg,
        ),
        CustomTextFormField(
          validator: (val) {
            return AppValidators.validatePassword(val);
          },
          isObscure: isObscure,
          hintText: AppStrings.password.tr(),
          controller: widget.passController,
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
        CustomTextFormField(
          validator: (val) {
            return AppValidators.validatePassword(val);
          },
          isObscure: isObscure2,
          hintText: AppStrings.rePassword.tr(),
          controller: widget.rePassController,
          prefixIconImage: AppImages.passwordSvg,
          suffixIcon: IconButton(
            icon: Icon(
              isObscure2
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: AppColors.grey,
            ),
            onPressed: () {
              setState(() {
                isObscure2 = !isObscure2;
              });
            },
          ),
        ),
      ],
    );
  }
}
