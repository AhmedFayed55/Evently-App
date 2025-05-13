import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/helpers/dialogue_utils.dart';
import 'package:evently_app/core/helpers/validators.dart';
import 'package:evently_app/core/re_useable_widgets/CustomButton.dart';
import 'package:evently_app/core/re_useable_widgets/custom_text_form_field.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController emailController = TextEditingController(
    text: "ahmedroute@gmail.com",
  );
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.forgetPassword.tr())),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              spacing: 24.h,
              children: [
                Image.asset(AppImages.forgetPass),
                CustomTextFormField(
                  validator: AppValidators.validateEmail,
                  controller: emailController,
                  hintText: AppStrings.email.tr(),
                  prefixIconImage: AppImages.emailSvg,
                ),
                CustomButton(
                  title: AppStrings.resetPassword.tr(),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text,
                      );
                      DialogueUtils.showLoading(
                        context: context,
                        message: AppStrings.processingYourRequest.tr(),
                      );
                      Future.delayed(Duration(seconds: 2), () {
                        DialogueUtils.hideLoading(context);
                        DialogueUtils.showMessage(
                          context: context,
                          message: AppStrings.resetPasswordEmailSent.tr(),
                          title: AppStrings.success.tr(),
                          posActionName: AppStrings.ok.tr(),
                        );
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
