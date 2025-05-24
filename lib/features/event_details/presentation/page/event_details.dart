import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';
import 'package:evently_app/features/add_event/presentation/widgets/event_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/text_styles.dart';
import '../widgets/date_and_time_container.dart';
import '../widgets/edit_and_delete_row.dart';
import '../widgets/location_container.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Event;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.eventDetails.tr(),
          style: TextStyles.medium20Primary,
        ),
        actions: [
          EditAndDeleteRow(
            edit: () {
              Navigator.pushNamed(
                context,
                AppRoutes.editEvent,
                arguments: args,
              );
            },
            delete: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.h,
          children: [
            EventImageWidget(eventImage: args.imagePath!),
            Text(args.title!, style: TextStyles.medium24Primary),
            DateAndTimeContainer(
              date: DateFormat('d MMMM yyyy').format(args.date!.toDate()),
              time: DateFormat('h:mm a').format(args.date!.toDate()),
            ),
            LocationContainer(region: args.city!, country: args.country!),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryLight),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(AppImages.hugeMap, fit: BoxFit.fill),
            ),
            Column(
              spacing: 3.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.description.tr(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  args.description!,
                  maxLines: 7,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
