import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../add_event/data/models/event.dart';

class MapTabEventsListViewItem extends StatelessWidget {
  const MapTabEventsListViewItem({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 32.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        border: Border.all(color: AppColors.primaryLight, width: 2),
      ),
      height: 95.h,
      width: 340.w,
      child: Row(
        spacing: 8.w,
        children: [
          Container(
            width: 138.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(event.imagePath!),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  event.title!,
                  style: TextStyles.bold14Primary,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                Row(
                  spacing: 4,
                  children: [
                    SvgPicture.asset(
                      AppImages.mapUnselected,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Text(
                        event.country ?? 'Unknown',
                        style: TextStyles.medium14White.copyWith(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                Row(
                  spacing: 4,
                  children: [
                    SvgPicture.asset(
                      AppImages.mapUnselected,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Text(
                        event.city ?? 'Unknown',
                        style: TextStyles.medium14White.copyWith(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
