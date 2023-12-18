import 'package:flutter/material.dart';

final appThemeData = ThemeData(
  // useMaterial3: true,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.secondaryColor,
  ),
  scaffoldBackgroundColor: AppColors.hardDarkColor,
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.lightColor,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColorWO,
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.lightColor,
    ),

    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColorWO,
    ),
    bodySmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColors.whiteColorWO,
    ),
  ),
);

class AppColors {
  AppColors._();

  static const whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const whiteColorWO = Color.fromRGBO(255, 255, 255, 0.7);
  static const secondaryColor = Color.fromRGBO(0, 200, 150, 1);
  static const redColor = Color.fromRGBO(235, 87, 87, 1);
  static const lightColor = Color.fromRGBO(224, 220, 221, 1);
  static const darkColorWO = Color.fromRGBO(28, 28, 28, 0.8);
  static const primaryColor = Color.fromRGBO(26, 26, 26, 1);
  static const hardDarkColor = Color.fromRGBO(13, 13, 13, 1);
  static const greyColor = Color.fromRGBO(155, 138, 143, 1);

// static const easyDarkColor = Color.fromRGBO(36, 36, 36, 1);
//
// static const darkGreyColor = Color.fromRGBO(85, 85, 85, 1);
// static const yellowColor = Color(0x00fec158);
}
