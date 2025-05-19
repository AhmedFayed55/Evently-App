import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/event_details.dart';
import 'event_categories_item_widget.dart';

class EventCategoriesListView extends StatefulWidget {
  const EventCategoriesListView({super.key, required this.onIndexChanged});

  final ValueChanged<int> onIndexChanged;

  @override
  State<EventCategoriesListView> createState() =>
      _EventCategoriesListViewState();
}

class _EventCategoriesListViewState extends State<EventCategoriesListView> {
  int selectedIndex = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: EventData.eventNames.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onIndexChanged(index);
            },
            child: EventCategoriesItemWidget(
              icon: EventData.eventIcons[index],
              eventName: EventData.eventNames[index].tr(),
              isSelected: selectedIndex == index,
            ),
          );
        },
      ),
    );
  }
}
