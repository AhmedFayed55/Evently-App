import 'package:flutter/material.dart';

import '../features/add_event/data/models/event.dart';

class EventProvider extends ChangeNotifier {
  List<Event> eventsList = [];
  List<Event> filteredList = [];
}
