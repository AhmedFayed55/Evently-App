import 'package:evently_app/core/helpers/shared_prefrence.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:evently_app/features/onboarding_screen/model/onboarding_screen_model.dart';
import 'package:evently_app/features/onboarding_screen/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activeIndex = 0;
  var controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 28.h,
          children: [
            Image.asset(AppImages.logo),
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                itemCount: OnboardingModel.onboardingList.length,
                itemBuilder: (context, index) {
                  return OnboardingItem(
                    model: OnboardingModel.onboardingList[index],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                activeIndex != 0
                    ? ElevatedButton(
                      onPressed: () {
                        controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                          side: BorderSide(
                            color: AppColors.primaryLight,
                            width: 1.3,
                          ),
                        ),
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? AppColors.primaryDark
                                : AppColors.white,
                        elevation: 0,
                      ),
                      child: Icon(Icons.arrow_back),
                    )
                    : SizedBox.shrink(),
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: OnboardingModel.onboardingList.length,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 2.5,
                    dotHeight: 8.3.h,
                    radius: 7.r,
                    dotWidth: 9.w,
                    dotColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColors.white
                            : AppColors.black,
                    activeDotColor: AppColors.primaryLight,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (activeIndex ==
                        OnboardingModel.onboardingList.length - 1) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.homeScreen,
                        (route) => false,
                      );
                      SharedPreferenceUtils.saveData(
                        key: AppStrings.firstTime,
                        value: false,
                      );
                    }

                    controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: AppColors.primaryLight,
                        width: 1.3,
                      ),
                    ),
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColors.primaryDark
                            : AppColors.white,
                    elevation: 0,
                  ),
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
