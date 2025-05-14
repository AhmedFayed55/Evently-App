import 'package:evently_app/features/tabs/home_tab/widgets/home_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/event_item_widget.dart';
import '../widgets/tab_bar_categories.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTabCustomAppBar(),
        TabBarCategories(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) => EventItemWidget(),
            ),
          ),
        ),
      ],
    );
  }
}
