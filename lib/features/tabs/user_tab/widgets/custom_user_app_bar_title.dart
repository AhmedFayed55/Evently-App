import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class CustomUserTabAppBarTitle extends StatelessWidget {
  const CustomUserTabAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      ),
      child: Row(
        spacing: 16.w,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            child: Image.asset("assets/images/user_bar_image.png"),
          ),
          Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ahmed Fayed", style: TextStyles.bold24White),
              Text(
                FirebaseAuth.instance.currentUser?.email ??
                    "ahmedfayed@route.com",
                style: TextStyles.medium16White,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
