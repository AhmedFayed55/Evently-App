import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/core/utils/text_styles.dart';
import 'package:evently_app/features/tabs/manager/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class PickEventLocation extends StatefulWidget {
  const PickEventLocation({super.key});

  @override
  State<PickEventLocation> createState() => _PickEventLocationState();
}

class _PickEventLocationState extends State<PickEventLocation> {
  late EventsProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EventsProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<EventsProvider>(context);
    return Consumer<EventsProvider>(
      builder:
          (context, value, child) => Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    onTap: (location) {
                      provider.changeLocation(location);
                      print(
                        "Location => ${provider.eventLocation!.latitude} ${provider.eventLocation!.longitude}",
                      );
                      Navigator.pop(context, provider.eventLocation);
                    },
                    zoomControlsEnabled: false,
                    markers: provider.markers,
                    initialCameraPosition: provider.cameraPosition,
                    onMapCreated:
                        (mapController) =>
                            provider.mapController = mapController,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.primaryLight),
                  child: Text(
                    AppStrings.tapOnLocationToSelect.tr(),
                    style: TextStyles.medium20White,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
