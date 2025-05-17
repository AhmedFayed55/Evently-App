import '../utils/app_images.dart';
import '../utils/app_strings.dart';

class EventData {
  static List<String> eventNames = [
    AppStrings.sport,
    AppStrings.birthday,
    AppStrings.meeting,
    AppStrings.gaming,
    AppStrings.bookClub,
    AppStrings.holiday,
    AppStrings.eating,
  ];

  static List<String> eventIcons = [
    AppImages.sportSvg,
    AppImages.birthdaySvg,
    AppImages.meetingSvg,
    AppImages.gamingSvg,
    AppImages.bookSvg,
    AppImages.holidaySvg,
    AppImages.eatingSvg,
  ];

  static Map<String, String> eventImages = {
    AppImages.sportLight: AppImages.sportDark,
    AppImages.birthdayLight: AppImages.birthdayDark,
    AppImages.meetingLight: AppImages.meetingDark,
    AppImages.gamingLight: AppImages.gamingDark,
    AppImages.bookClubLight: AppImages.bookClubDark,
    AppImages.holidayLight: AppImages.holidayDark,
    AppImages.eatingLight: AppImages.eatingDark,
  };
}
