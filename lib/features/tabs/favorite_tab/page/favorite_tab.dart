import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/re_useable_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/text_styles.dart';
import '../../home_tab/widgets/event_item_widget.dart';
import '../../manager/home_tab_provider.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();

    // Run after build to safely use Provider with context
    // Delay execution until after widget build to safely access context
    Future.microtask(() {
      Provider.of<EventsProvider>(context, listen: false).fetchFavoriteEvents();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsProvider>(context);
    final favoriteEvents = provider.favoriteEvents;
    final isLoading = provider.isFavoriteLoading;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextFormField(
              validator: (val) => null,
              hintStyle: TextStyles.bold14Primary,
              borderColor: AppColors.primaryLight,
              controller: searchController,
              hintText: AppStrings.searchForEvent.tr(),
              prefixIconImage: AppImages.searchSvg,
            ),
          ),
          if (isLoading)
            const Expanded(
              child: Center(child: CircularProgressIndicator()),
            )
          else
            if (favoriteEvents.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    "No Events Yet",
                    style: TextStyles.bold20Primary,
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: favoriteEvents.length,
                  itemBuilder: (context, index) =>
                      EventItemWidget(event: favoriteEvents[index]),
                ),
              ),
        ],
      ),
    );
  }
}
