import 'package:evently_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      height: 212.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryLight, width: 1.5),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage("assets/images/test.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.outline,
                ),
                child: Column(
                  children: [
                    Text("21", style: TextStyles.bold20Primary),
                    Text("Nov", style: TextStyles.bold14Primary),
                  ],
                ),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(
              //       horizontal: width * .02, vertical: height * .001),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(12),
              //       color: AppColors.white),
              //   child: Column(
              //     children: [
              //       Text(
              //         event.date.day.toString(),
              //         style: AppStyles.bold20Primary,
              //       ),
              //       Text(DateFormat("MMM").format(event.date),
              //           style: AppStyles.bold16Primary)
              //     ],
              //   ),
              // ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * .02,
              vertical: height * .01,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.outline,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Title", style: Theme.of(context).textTheme.titleLarge),
                InkWell(
                  onTap: () {
                    // todo: update favorite
                  },
                  child: Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
