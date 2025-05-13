import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/helpers/dialogue_utils.dart';
import 'package:evently_app/core/re_useable_widgets/CustomButton.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/auth/presentation/manager/auth_interface.dart';
import 'package:evently_app/features/auth/presentation/manager/auth_view_model.dart';
import 'package:evently_app/features/start_screen/widgets/language_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/di.dart';
import '../widgets/register_fields.dart';
import '../widgets/text_rich.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements AuthInterface {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController rePassController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthViewModel viewModel = injectAuthViewModel();

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
                RegisterFields(
                    nameController: nameController,
                    emailController: emailController,
                    passController: passController,
                    rePassController: rePassController),
                CustomButton(
                  title: AppStrings.createAccount.tr(),
                  onPressed: register,
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController(text: "ahmed");
    emailController = TextEditingController(text: "ahmedroute@gmail.com");
    passController = TextEditingController(text: "123456@aA");
    rePassController = TextEditingController(text: "123456@aA");
    viewModel.interface = this;
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

  void register() async {
    if (formKey.currentState!.validate()) {
      viewModel.register(emailController.text, passController.text, context);
    }
  }

  @override
  void hideMyLoading() {
    DialogueUtils.hideLoading(context);
  }

  @override
  void showMyLoading(String message) {
    DialogueUtils.showLoading(context: context, message: message);
  }

  @override
  void showMyMessage({
    String? message,
    String? title,
    String? buttonText,
    Function? onPressed,
  }) {
    DialogueUtils.showMessage(
      context: context,
      message: message ?? '',
      title: title ?? '',
      posActionName: buttonText ?? 'OK',
      posAction: onPressed,
    );
  }

}



