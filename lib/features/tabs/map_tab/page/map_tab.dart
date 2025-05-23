import 'package:evently_app/features/tabs/manager/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/map_tab_events_list_view.dart';

class MapTab extends StatefulWidget {
  const MapTab({super.key});

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {

  @override
  void initState() {
    super.initState();
    // todo: load all events
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EventsProvider>(context, listen: false).fetchAllEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    EventsProvider provider = Provider.of<EventsProvider>(context);
    return Consumer<EventsProvider>(
      builder:
          (context, value, child) =>
          Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                provider.getLocation();
              },
              child: Icon(Icons.gps_fixed, size: 28,),
            ),
            body: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: GoogleMap(
                        zoomControlsEnabled: false,
                        markers: provider.markers,
                        initialCameraPosition: provider.cameraPosition,
                        onMapCreated:
                            (mapController) =>
                        provider.mapController = mapController,
                      ),
                    ),
                  ],
                ),
                provider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : provider.events.isEmpty
                    ? SizedBox.shrink()
                    : MapEventsListView(events: provider.events,),
              ],
            ),
          ),
    );
  }
}






