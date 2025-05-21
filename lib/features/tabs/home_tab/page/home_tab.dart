import 'package:evently_app/core/utils/text_styles.dart';
import 'package:evently_app/features/tabs/home_tab/widgets/event_item_widget.dart';
import 'package:evently_app/features/tabs/home_tab/widgets/home_custom_app_bar.dart';
import 'package:evently_app/features/tabs/home_tab/widgets/tab_bar_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../manager/home_tab_provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  String selectedCategory = "all";

  @override
  void initState() {
    super.initState();
    // todo: load all events
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventsProvider>(context, listen: false).fetchAllEvents();
    });
  }

  void _onTabChanged(int index, String category) {
    final provider = Provider.of<EventsProvider>(context, listen: false);

    setState(() {
      selectedIndex = index;
      selectedCategory = category;
    });

    if (index == 0) {
      provider.fetchAllEvents();
    } else {
      provider.fetchEventsByCategory(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);

    return Column(
      children: [
        HomeTabCustomAppBar(),
        TabBarCategories(
          onTabChanged: _onTabChanged,
        ),
        provider.isLoading
            ? const Expanded(child: Center(child: CircularProgressIndicator()))
            : provider.events.isEmpty
            ? Expanded(
            child: Center(
                child: Text("No Events Yet",
                    style: TextStyles.bold20Primary)))
            : Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: provider.events.length,
            itemBuilder: (context, index) =>
                EventItemWidget(
                    event: provider.events[index]),
          ),
        ),
      ],
    );
  }
}
