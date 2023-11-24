import 'package:flutter/material.dart';
import 'package:goodiez_abalone/theme/colors.dart';

class GoodiezTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      appBarTheme: base.appBarTheme.copyWith(
        iconTheme: const IconThemeData(color: AppColor.darkGray),
      ),
      primaryColor: AppColor.primaryColor,
      primaryColorLight: AppColor.primaryColorLight,
      primaryColorDark: AppColor.primaryColorDark,
      scaffoldBackgroundColor: Colors.white,
      primaryTextTheme: base.textTheme.apply(
        fontFamily: "Inter",
        bodyColor: AppColor.darkGray,
        displayColor: AppColor.darkGray,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: -1,
          color: AppColor.darkGray,
        ),
        headline2: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
          color: AppColor.darkGray,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ).apply(
        fontFamily: "Inter",
        bodyColor: AppColor.darkGray,
        displayColor: AppColor.darkGray,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: AppColor.primaryColor,
          fontFamily: 'Inter',
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColor.defaultGray,
          fontFamily: 'Inter',
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
        unselectedItemColor: AppColor.defaultGray,
        selectedItemColor: AppColor.primaryColor,
        showUnselectedLabels: true,
      ),
    );
  }
}
