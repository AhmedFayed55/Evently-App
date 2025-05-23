import 'package:flutter/material.dart';

import '../../../add_event/data/models/event.dart';
import 'map_list_view_item.dart';

class MapTabEventsListView extends StatelessWidget {
  const MapTabEventsListView({super.key, required this.events});

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        itemCount: events.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => MapTabEventsListViewItem(event: events[index]),
      ),
    );
  }
}
