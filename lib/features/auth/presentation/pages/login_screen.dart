import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/helpers/dialogue_utils.dart';
import 'package:evently_app/core/helpers/spacing.dart';
import 'package:evently_app/core/re_useable_widgets/CustomButton.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/auth/presentation/manager/auth_interface.dart';
import 'package:evently_app/features/auth/presentation/manager/auth_view_model.dart';
import 'package:evently_app/features/auth/presentation/widgets/forget_password_text.dart';
import 'package:evently_app/features/auth/presentation/widgets/login_fields.dart';
import 'package:evently_app/features/start_screen/widgets/language_toggle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/di/di.dart';
import '../widgets/login_with_google.dart';
import '../widgets/or_widget.dart';
import '../widgets/text_rich.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements AuthInterface {
  late TextEditingController emailController;
  late TextEditingController passController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthViewModel viewModel = injectAuthViewModel();

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
                  LoginFields(emailController: emailController,
                      passController: passController),
                  verticalSpace(16),
                  ForgetPasswordText(),
                  verticalSpace(16),
                  CustomButton(title: AppStrings.login.tr(), onPressed: login),
                  verticalSpace(16),
                  DontAlreadyHave(
                    text1: AppStrings.dontHaveAccount.tr(),
                    text2: AppStrings.createAccount.tr(),
                    navRoute: AppRoutes.register,
                  ),
                  verticalSpace(30),
                  const OrWidget(),
                  verticalSpace(30),
                  LoginWithGoogle(googleSignIn: signInWithGoogle,),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController(text: "ahmedroute@gmail.com");
    passController = TextEditingController(text: "123456@aA");
    viewModel.interface = this;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      viewModel.login(emailController.text, passController.text, context);
    }
  }

  signInWithGoogle() async {
    DialogueUtils.showLoading(
        context: context, message: AppStrings.processingYourRequest.tr());
    try {
      await _googleLogin();
      DialogueUtils.hideLoading(context);
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
    } catch (e) {
      print(e);
    }
  }

  _googleLogin() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
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



