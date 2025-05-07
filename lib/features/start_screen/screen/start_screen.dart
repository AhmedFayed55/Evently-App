import 'package:evently_app/core/helpers/spacing.dart';
import 'package:evently_app/core/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/re_useable_widgets/CustomButton.dart';
import '../../../core/utils/strings_manager.dart';
import '../widgets/language_toggle.dart';
import '../widgets/theme_toggle.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(AssetsManager.logo)),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(AssetsManager.beingCreative1),
                    ),
                  ),
                  Text(
                    StringsManager.personalizeExp,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  verticalSpace(28),
                  Text(
                    StringsManager.startDesc,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  verticalSpace(28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringsManager.language,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      LanguageToggle(),
                    ],
                  ),
                  verticalSpace(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringsManager.theme,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      ThemeToggle(),
                    ],
                  ),
                  verticalSpace(28),
                ],
              ),
            ),
            CustomButton(title: StringsManager.letsStart, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
