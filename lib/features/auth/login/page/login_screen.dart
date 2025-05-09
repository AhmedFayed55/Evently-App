import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/helpers/spacing.dart';
import 'package:evently_app/core/re_useable_widgets/CustomButton.dart';
import 'package:evently_app/core/re_useable_widgets/custom_text_form_field.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/core/utils/text_styles.dart';
import 'package:evently_app/features/auth/login/widgets/or_widget.dart';
import 'package:evently_app/features/auth/login/widgets/text_rich.dart';
import 'package:evently_app/features/start_screen/widgets/language_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/login_with_google.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passController;
  bool isObscure = true;
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.locale; // Force rebuild on locale change
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(AppImages.authLogo),
                  verticalSpace(24),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: AppStrings.email.tr(),
                    prefixIconImage: AppImages.emailSvg,
                  ),
                  verticalSpace(16),
                  CustomTextFormField(
                    isObscure: isObscure,
                    controller: passController,
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
                  verticalSpace(16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.forgetPassword);
                      },
                      child: Text(
                        AppStrings.forgetPassword.tr(),
                        style: TextStyles.bold16Primary.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryLight,
                        ),
                      ),
                    ),
                  ),
                  verticalSpace(16),
                  CustomButton(title: AppStrings.login.tr(), onPressed: () {}),
                  verticalSpace(16),
                  DontAlreadyHave(
                    text1: AppStrings.dontHaveAccount.tr(),
                    text2: AppStrings.createAccount.tr(),
                    navRoute: AppRoutes.register,
                  ),
                  verticalSpace(30),
                  const OrWidget(),
                  verticalSpace(30),
                  LoginWithGoogle(),
                  verticalSpace(30),
                  const LanguageToggle(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
