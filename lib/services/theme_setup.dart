import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

List<ThemeData> getThemes() {
  return [
    ThemeData.light().copyWith(
      accentColor: AppColors.greenColor,
      appBarTheme: AppBarTheme(
        color: AppColors.whiteColor,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        textTheme: TextTheme(
          headline6: TextStyle(color: AppColors.blackColor, fontSize: 20.0),
        ),
        actionsIconTheme: IconThemeData(color: AppColors.blackColor),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
        backgroundColor: AppColors.greenColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.greenColor,
      ),
    ),
    ThemeData.light(),
    ThemeData.dark(),
    ThemeData.dark().copyWith(
      accentColor: AppColors.kimbieAccent,
      appBarTheme: AppBarTheme(
        color: AppColors.kimbieAccent,
        iconTheme: IconThemeData(color: AppColors.blackColor),
        textTheme: TextTheme(
          headline6: TextStyle(color: AppColors.blackColor, fontSize: 20.0),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
        backgroundColor: AppColors.kimbieAccent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.kimbieAccent,
      ),
    ),
  ];
}
