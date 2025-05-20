import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/firebase/firestore_handler.dart';
import '../../../../core/re_useable_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../add_event/data/models/event.dart';
import '../../home_tab/widgets/event_item_widget.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextFormField(
              validator: (val) {
                return null;
              },
              hintStyle: TextStyles.bold14Primary,
              borderColor: AppColors.primaryLight,
              controller: searchController,
              hintText: AppStrings.searchForEvent.tr(),
              prefixIconImage: AppImages.searchSvg,
            ),
          ),
          FutureBuilder(
            future: FireStoreHandler.getMyFavorite(
              FirebaseAuth.instance.currentUser!.uid,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                List<Event> events = snapshot.data ?? [];
                return events.isEmpty
                    ? Center(
                      child: Text(
                        "No Events Yet",
                        style: TextStyles.bold20Primary,
                      ),
                    )
                    : Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: events.length,
                        itemBuilder:
                            (context, index) =>
                                EventItemWidget(event: events[index]),
                      ),
                    );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
}
