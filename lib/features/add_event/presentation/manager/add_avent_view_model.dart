import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/helpers/flutter_toast.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/add_event/data/repositories/add_event_repo.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_routes.dart';
import '../../data/models/event.dart';

class AddEventViewModel extends ChangeNotifier {
  final AddEventRepository repository;

  AddEventViewModel({required this.repository});

  void createEvent(
    Event event,
    BuildContext context,
    DateTime? date,
    TimeOfDay? time,
  ) async {
    var either = await repository.createEvent(event);
    either.fold(
      (error) => ToastMessage.toastMsg(
        AppStrings.fail.tr(),
        Colors.red,
        AppColors.white,
      ),
      (_) {
        ToastMessage.toastMsg(
          AppStrings.addYourEventSuccessfully.tr(),
          Colors.green,
          AppColors.white,
        );
        Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
      },
    );
  }
}
