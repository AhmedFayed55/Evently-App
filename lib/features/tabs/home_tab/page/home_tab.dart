import 'package:evently_app/core/firebase/firestore_handler.dart';
import 'package:evently_app/core/utils/text_styles.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';
import 'package:evently_app/features/tabs/home_tab/widgets/home_custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/event_item_widget.dart';
import '../widgets/tab_bar_categories.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  String selectedCategory = "all";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTabCustomAppBar(),
        TabBarCategories(onIndexChanged: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        }, onCategoryChanged: (newCategory) {
          setState(() {
            selectedCategory = newCategory;
          });
        },),
        selectedIndex == 0 ? FutureBuilder(
          future: FireStoreHandler.getAllEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              List<Event> events = snapshot.data ?? [];
              return events.isEmpty ? Center(child: Text(
                "No Events Yet", style: TextStyles.bold20Primary,)) :
              Expanded(child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: events.length,
                itemBuilder: (context, index) =>
                    EventItemWidget(event: events[index]),
              ));
            }
          },
        ) : FutureBuilder(
          future: FireStoreHandler.getEventsByCategory(selectedCategory),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              List<Event> events = snapshot.data ?? [];
              return events.isEmpty ? Center(child: Text(
                "No Events Yet", style: TextStyles.bold20Primary,)) :
              Expanded(child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: events.length,
                itemBuilder: (context, index) =>
                    EventItemWidget(event: events[index]),
              ));
            }
          },)
      ],
    );
  }
}
