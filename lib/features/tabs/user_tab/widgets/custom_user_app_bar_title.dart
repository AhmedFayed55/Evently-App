import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../providers/user_provider.dart';

class CustomUserTabAppBarTitle extends StatelessWidget {
  const CustomUserTabAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
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
              provider.isLoading
                  ? CircularProgressIndicator(color: AppColors.white)
                  : Text(
                    provider.user?.name ?? "No Name",
                    style: TextStyles.bold24White,
                  ),
              Text(
                provider.user?.email ?? "No Email",
                style: TextStyles.medium16White,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
