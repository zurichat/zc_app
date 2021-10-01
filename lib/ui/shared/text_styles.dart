import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

class ZuriTextStyle {
  static const double _smallSize = 13;
  static const double _mediumSize = 15;
  static const double _largeSize = 17;
  // static double _extraLargeSize = 20;

  static const FontWeight _light = FontWeight.w300;
  static const FontWeight _normal = FontWeight.w400;
  static const FontWeight _bold = FontWeight.w600;
  // static FontWeight _extraBold = FontWeight.w800;

  //For smaller sized text
  static TextStyle smallLight() {
    return _base(_smallSize, _light, AppColors.darkGreyColor);
  }

  static TextStyle smallNormal() {
    return _base(_smallSize, _normal, AppColors.darkGreyColor);
  }

  static TextStyle smallBold() {
    return _base(_smallSize, _bold, AppColors.deepBlackColor);
  }

  //For medium range sized text
  static TextStyle mediumLight() {
    return _base(_mediumSize, _light, AppColors.darkGreyColor);
  }

  static TextStyle mediumNormal({Color? color}) {
    return _base(_mediumSize, _normal, color ?? AppColors.darkGreyColor);
  }

  static TextStyle mediumBold() {
    return _base(_mediumSize, _bold, AppColors.deepBlackColor);
  }

  //For large sized text
  static TextStyle largeLight() {
    return _base(_largeSize, _light, AppColors.darkGreyColor);
  }

  static TextStyle largeNormal() {
    return _base(_largeSize, _normal, AppColors.darkGreyColor);
  }

  static TextStyle largeBold() {
    return _base(_largeSize, _bold, AppColors.deepBlackColor);
  }

  //! Add custom text below
  //  Add custom text below
  //? Add custom text below

  static TextStyle unreadText() {
    return _base(
      _mediumSize,
      FontWeight.w800,
      AppColors.blackColor.withOpacity(0.8),
    );
  }

  static TextStyle organizationNameText() {
    return _base(
      19,
      FontWeight.w800,
      AppColors.whiteColor.withOpacity(0.9),
    );
  }

  ///This base class minimizes the amount of code and cannot
  ///be used outside this class
  static TextStyle _base(
    double size,
    FontWeight? fontWeight,
    Color? color,
  ) {
    return baseStyle(fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle baseStyle({
    double fontSize = 13,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.grey[600],
    );
  }
}
