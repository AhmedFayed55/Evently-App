import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/firebase/firestore_handler.dart';
import 'package:evently_app/core/helpers/flutter_toast.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/core/utils/text_styles.dart';
import 'package:evently_app/features/add_event/data/models/event.dart';
import 'package:evently_app/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';

class EventItemWidget extends StatefulWidget {
  const EventItemWidget({super.key, required this.event});

  final Event event;

  @override
  State<EventItemWidget> createState() => _EventItemWidgetState();
}

class _EventItemWidgetState extends State<EventItemWidget> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    List<String> userFavoritesIds = userProvider.user?.favorites ?? [];
    return Container(
      margin: EdgeInsets.only(top: 16.h, right: 16.h, left: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      height: 212.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryLight, width: 1.5),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(widget.event.imagePath!),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).colorScheme.outline,
                ),
                child: Column(
                  children: [
                    Text(widget.event.date!.toDate().day.toString(),
                        style: TextStyles.bold20Primary),
                    Text(DateFormat.MMM().format(widget.event.date!.toDate()),
                        style: TextStyles.bold14Primary),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.outline,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.event.title!, style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge),
                IconButton(
                  icon: Icon(
                    userFavoritesIds.contains(widget.event.id) ? Icons.favorite
                        : Icons.favorite_border_rounded,
                    // : Icons.favorite,
                    color: AppColors.primaryLight,),
                  onPressed: () async {
                    if (userFavoritesIds.contains(widget.event.id)) {
                      // todo: remove from favorite
                      await FireStoreHandler.removeFromFavorite(
                          FirebaseAuth.instance.currentUser!.uid,
                          widget.event.id!);
                      userProvider.user?.favorites?.remove(
                          widget.event.id ?? "");
                      ToastMessage.toastMsg(
                          AppStrings.removeFromFavoriteSuccessfully.tr(),
                          Colors.green, AppColors.white);
                      await FireStoreHandler.updateUserFavorites(
                          FirebaseAuth.instance.currentUser!.uid,
                          userProvider.user?.favorites ?? []);
                      setState(() {});
                    } else {
                      // todo: add to favorite
                      await FireStoreHandler.addToFavorite(
                          FirebaseAuth.instance.currentUser!.uid,
                          widget.event);
                      userProvider.user?.favorites?.add(widget.event.id ?? "");
                      ToastMessage.toastMsg(
                          AppStrings.addToFavoriteSuccessfully.tr(),
                          Colors.green, AppColors.white);
                      await FireStoreHandler.updateUserFavorites(
                          FirebaseAuth.instance.currentUser!.uid,
                          userProvider.user?.favorites ?? []);
                      setState(() {});
                    }
                  },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
