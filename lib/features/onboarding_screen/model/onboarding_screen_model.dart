import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_strings.dart';

class OnboardingModel {
  String image;
  String title;
  String subtitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  static List<OnboardingModel> onboardingList = [
    OnboardingModel(
      image: AppImages.beingCreative4,
      title: AppStrings.findEventsThatInspireYou.tr(),
      subtitle: AppStrings.diveIntoAWorldOfEvents.tr(),
    ),
    OnboardingModel(
      image: AppImages.beingCreative2,
      title: AppStrings.effortlessEventPlanning.tr(),
      subtitle: AppStrings.takeTheHassleOutOfOrganizingEvents.tr(),
    ),
    OnboardingModel(
      image: AppImages.beingCreative3,
      title: AppStrings.connectWithFriendsAndShareMoments.tr(),
      subtitle: AppStrings.makeEveryEventMemorable.tr(),
    ),
  ];
}
