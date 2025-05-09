import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/helpers/spacing.dart';
import 'package:evently_app/core/helpers/validators.dart';
import 'package:evently_app/core/re_useable_widgets/CustomButton.dart';
import 'package:evently_app/core/re_useable_widgets/custom_text_form_field.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/auth/login/widgets/text_rich.dart';
import 'package:evently_app/features/start_screen/widgets/language_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController rePassController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.register.tr())),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              spacing: 16.h,
              children: [
                Image.asset(AppImages.authLogo),
                verticalSpace(8),
                CustomTextFormField(
                  hintText: AppStrings.name.tr(),
                  controller: nameController,
                  prefixIconImage: AppImages.nameSvg,
                ),
                CustomTextFormField(
                  validator: (val) {
                    return AppValidators.validateEmail(val);
                  },
                  hintText: AppStrings.email.tr(),
                  controller: emailController,
                  prefixIconImage: AppImages.emailSvg,
                ),
                CustomTextFormField(
                  validator: (val) {
                    return AppValidators.validatePassword(val);
                  },
                  isObscure: isObscure,
                  hintText: AppStrings.password.tr(),
                  controller: passController,
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
                  controller: rePassController,
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
                CustomButton(
                  title: AppStrings.createAccount.tr(),
                  onPressed: createAccount,
                ),
                DontAlreadyHave(
                  text1: AppStrings.alreadyHaveAccount.tr(),
                  text2: AppStrings.login.tr(),
                  navRoute: AppRoutes.login,
                ),
                LanguageToggle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() {
    if (formKey.currentState!.validate()) {
      print("okkkkkkkkkk");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    rePassController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    rePassController.dispose();
  }
}
