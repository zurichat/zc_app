import 'package:flutter/material.dart';

import '../ui/shared/colors.dart';

List<ThemeData> getThemes() {
  return [
    ThemeData.light().copyWith(
      primaryColor: AppColors.zuriPrimaryColor,
      accentColor: AppColors.zuriPrimaryColor,
      appBarTheme: const AppBarTheme(
        color: AppColors.whiteColor,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        textTheme: TextTheme(
          headline6: TextStyle(color: AppColors.blackColor, fontSize: 20.0),
        ),
        actionsIconTheme: IconThemeData(color: AppColors.blackColor),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
        backgroundColor: AppColors.zuriPrimaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.zuriPrimaryColor,
      ),
    ),
    ThemeData.light(),
    ThemeData.dark(),
    ThemeData.dark().copyWith(
      accentColor: AppColors.kimbieAccent,
      appBarTheme: const AppBarTheme(
        color: AppColors.kimbieAccent,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        textTheme: TextTheme(
          headline6: TextStyle(color: AppColors.blackColor, fontSize: 20.0),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
        backgroundColor: AppColors.kimbieAccent,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.kimbieAccent,
      ),
    ),
  ];
}
