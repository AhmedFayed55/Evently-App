import 'package:evently_app/core/utils/text_styles.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_colors.dart';

class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key, required this.event});

  final Event event;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, right: 16.h, left: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      height: 212.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryLight, width: 1.5),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(event.imagePath!),
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
                    Text(event.date!.toDate().day.toString(),
                        style: TextStyles.bold20Primary),
                    Text(DateFormat.MMM().format(event.date!.toDate()),
                        style: TextStyles.bold14Primary),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.outline,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(event.title!, style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge),
                IconButton(
                  icon: Icon(!event.isFavorite! ? Icons.favorite_border_rounded
                      : Icons.favorite,
                    color: AppColors.primaryLight,),
                  onPressed: () {
                    // todo: update favorite
                  },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
