import 'package:flutter/material.dart';

import '../utils/assets.dart';
import '../utils/theme.dart';
import 'category_screen/category_screen.dart';
import 'favorite_screen/favorite_screen.dart';
import 'home_screen/home_screen.dart';
import 'profile_screen/profile_screen.dart';

enum TabItem {
  home,
  explore,
  bookmark,
  profile;

  Widget get icon {
    switch (this) {
      case TabItem.home:
        return AppIcons.home.svgPicture(color: AppColors.lightColor);
      case TabItem.explore:
        return AppIcons.globe.svgPicture(color: AppColors.lightColor);
      case TabItem.bookmark:
        return AppIcons.bookmark.svgPicture(color: AppColors.lightColor);
      case TabItem.profile:
        return AppIcons.settings.svgPicture(color: AppColors.lightColor);
    }
  }

  Widget get pages {
    switch (this) {
      case TabItem.home:
        return const HomeScreen();
      case TabItem.explore:
        return const ProfileScreen();
      case TabItem.bookmark:
        return const ProfileScreen();
      case TabItem.profile:
        return const ProfileScreen();
    }
  }

  String localizedTitle(BuildContext context) {
    // final localization = AppLocalizations.of(context);
    switch (this) {
      case TabItem.home:
        return 'Home';
      case TabItem.explore:
        return 'Explore';
      case TabItem.bookmark:
        return 'Bookmark';
      case TabItem.profile:
        return 'Profile';
    }
  }

  Widget get filledIcon {
    switch (this) {
      case TabItem.home:
        return AppIcons.home.svgPicture(color: AppColors.hardDarkColor);
      case TabItem.explore:
        return AppIcons.globe.svgPicture(color: AppColors.hardDarkColor);
      case TabItem.bookmark:
        return AppIcons.bookmark.svgPicture(color: AppColors.hardDarkColor);
      case TabItem.profile:
        return AppIcons.settings.svgPicture(color: AppColors.hardDarkColor);
    }
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    // const ProfileScreen(),
  ];
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedPage,
        onTap: (val) {
          selectedPage = val;
          setState(() {
            //no-op
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: AppIcons.home.svgPicture(color: AppColors.lightColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: AppIcons.globe.svgPicture(color: AppColors.lightColor),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: AppIcons.bookmark.svgPicture(color: AppColors.lightColor,),
            label: 'Saved',
          ),
          // BottomNavigationBarItem(
          //   icon: AppIcons.settings.svgPicture(color: AppColors.lightColor),
          //   label: 'Settings',
          // ),
        ],
      ),
    );
  }
}
