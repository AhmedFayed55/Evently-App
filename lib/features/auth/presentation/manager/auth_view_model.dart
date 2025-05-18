import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/firebase/firestore_handler.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/auth/data/repository/repos/auth_repository.dart';
import 'package:evently_app/features/auth/presentation/manager/auth_interface.dart';
import 'package:evently_app/models/user.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  late AuthInterface interface;
  AuthRepository repository;

  AuthViewModel({required this.repository});

  void register(String email, String password, String name,
      BuildContext context) async {
    interface.showMyLoading(AppStrings.processingYourRequest.tr());
    var either = await repository.register(email, password);
    either.fold(
      (error) {
        interface.hideMyLoading();
        interface.showMyMessage(
          title: AppStrings.fail.tr(),
          message: error.errorMessage,
          buttonText: AppStrings.ok.tr(),
        );
      },
          (response) async {
        User newUser = User(id: response.user!.uid, name: name, email: email);
        await FireStoreHandler.addUser(newUser);
        interface.hideMyLoading();
        interface.showMyMessage(
          title: AppStrings.success.tr(),
          message: AppStrings.yourAccountHas.tr(),
          buttonText: AppStrings.ok.tr(),
          onPressed: () {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
          },
        );
      },
    );
  }

  void login(String email, String password, BuildContext context) async {
    interface.showMyLoading(AppStrings.processingYourRequest.tr());
    var either = await repository.login(email, password);
    either.fold(
      (error) {
        interface.hideMyLoading();
        interface.showMyMessage(
          title: AppStrings.fail.tr(),
          message: error.errorMessage,
          buttonText: AppStrings.ok.tr(),
        );
      },
      (response) {
        interface.hideMyLoading();
        interface.showMyMessage(
          title: AppStrings.success.tr(),
          message: AppStrings.loginSuccessfully.tr(),
          buttonText: AppStrings.ok.tr(),
          onPressed: () {
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(AppRoutes.homeScreen, (route) => false);
          },
        );
      },
    );
  }
}
