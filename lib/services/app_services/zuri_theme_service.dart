// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../utilities/constants/colors.dart';

class ZuriThemeService {
  static ZuriThemeService? _instance;
  static ThemeService? _themeService;
  static Future<ZuriThemeService> getInstance() async {
    _instance ??= ZuriThemeService();
    _themeService ??= ThemeService.getInstance();
    return _instance!;
  }

  List<ThemeData> getThemes() {
    return [
      ThemeData.light().copyWith(
        primaryColor: AppColors.zuriPrimaryColor,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              ThemeData.light().textTheme.bodyText1!.color,
            ),
          ),
        ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
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
        scaffoldBackgroundColor: AppColors.darkModeColor,
        focusColor: AppColors.zuriPrimaryColor,
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

        inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.zuriPrimaryColor),
            ),
          )
      ),
    ];
  }

  void selectThemeAtIndex(int currentThemeValue) {
    _themeService!.selectThemeAtIndex(currentThemeValue);
  }
}
