import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/features/tabs/home_tab/widgets/tab_bar_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';

class TabBarCategories extends StatefulWidget {
  const TabBarCategories({super.key, required this.onTabChanged});

  final void Function(int index, String category) onTabChanged;

  @override
  State<TabBarCategories> createState() => _TabBarCategoriesState();
}

class _TabBarCategoriesState extends State<TabBarCategories> {
  Map<String, String> tabBarItems = {
    AppStrings.all: AppImages.allSvg,
    AppStrings.sport: AppImages.sportSvg,
    AppStrings.birthday: AppImages.birthdaySvg,
    AppStrings.meeting: AppImages.meetingSvg,
    AppStrings.gaming: AppImages.gamingSvg,
    AppStrings.bookClub: AppImages.bookSvg,
    AppStrings.holiday: AppImages.holidaySvg,
    AppStrings.eating: AppImages.eatingSvg,
  };

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> eventNames = tabBarItems.keys.toList();
    final List<String> icons = tabBarItems.values.toList();
    return Container(
      padding: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      height: 55.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        scrollDirection: Axis.horizontal,
        itemCount: eventNames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTabChanged(index, eventNames[index]);
            },
            child: TabBarItemWidget(
              eventName: eventNames[index].tr(),
              icon: icons[index],
              isSelected: selectedIndex == index,
            ),
          );
        },
      ),
    );
  }
}
