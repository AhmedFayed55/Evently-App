import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/utils/app_colors.dart';
import 'package:evently_app/core/utils/app_images.dart';
import 'package:evently_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tabs/favorite_tab/page/favorite_tab.dart';
import '../tabs/home_tab/page/home_tab.dart';
import '../tabs/map_tab/page/map_tab.dart';
import '../tabs/user_tab/page/user_tab.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), UserTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          _bottomNavBarItem(
            AppStrings.home,
            AppImages.homeUnselected,
            AppImages.homeSelected,
          ),
          _bottomNavBarItem(
            AppStrings.map,
            AppImages.mapUnselected,
            AppImages.mapSelected,
          ),
          _bottomNavBarItem(
            AppStrings.favorite,
            AppImages.favoriteUnselected,
            AppImages.favoriteSelected,
          ),
          _bottomNavBarItem(
            AppStrings.user,
            AppImages.userUnselected,
            AppImages.userSelected,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // todo: navigate to add new event screen
        },
        shape: StadiumBorder(
          side: BorderSide(color: AppColors.white, width: 4.5),
        ),
        child: Icon(Icons.add, size: 40, color: AppColors.white,),
      ),
      body: tabs[currentIndex],
    );
  }

  BottomNavigationBarItem _bottomNavBarItem(
    String label,
    String icon,
    String activeIcon,
  ) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: SvgPicture.asset(activeIcon),
      label: label.tr(),
    );
  }
}
