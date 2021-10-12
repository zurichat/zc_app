// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../ui/shared/colors.dart';

List<ThemeData> getThemes() {
  return [
    ThemeData.light().copyWith(
      primaryColor: AppColors.zuriPrimaryColor,
      // appBarTheme: const AppBarTheme(
      //   color: AppColors.whiteColor,
      //   iconTheme: IconThemeData(color: AppColors.blackColor),
      //   textTheme: TextTheme(
      //     headline6: TextStyle(color: AppColors.blackColor, fontSize: 20.0),
      //   ),
      //   actionsIconTheme: IconThemeData(color: AppColors.blackColor),
      // ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            ThemeData.light().textTheme.bodyText1!.color,
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
        backgroundColor: AppColors.zuriPrimaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.zuriPrimaryColor,
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: AppColors.zuriPrimaryColor),
    ),
    ThemeData.dark().copyWith(
      primaryColor: AppColors.zuriPrimaryColor,
      accentColor: AppColors.zuriPrimaryColor,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: AppColors.blackColor),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.whiteColor,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.zuriPrimaryColor,
        foregroundColor: Color(0xFF424242),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            ThemeData.dark().textTheme.bodyText1!.color,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.zuriPrimaryColor,
        backgroundColor: Color(0xFF212121),
        elevation: 8,
      ),
    ),
  ];

  //Kimbie Dark
  /*
  ThemeData.dark().copyWith(
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
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.kimbieAccent),
    ),
  
  */
}
