import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class DontAlreadyHave extends StatelessWidget {
  const DontAlreadyHave({
    super.key,
    required this.text1,
    required this.text2,
    required this.navRoute,
  });

  final String text1;
  final String text2;
  final String navRoute;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryLight,
              fontSize: 16,
              color: AppColors.primaryLight,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    // todo: navigate to register screen
                    Navigator.pushNamed(context, navRoute);
                  },
          ),
        ],
      ),
    );
  }
}
