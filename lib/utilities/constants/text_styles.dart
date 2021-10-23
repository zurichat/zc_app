import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zurichat/utilities/constants/colors.dart';

class AppTextStyle {
  // static const double _size10 = 11;
  static const double _size12 = 13;
  static const double _size14 = 14.5;
  static const double _size16 = 16.2;
  static const double _size18 = 19;
  static const double _size20 = 20.3;
  // static const double _size23 = 24;

  // static const FontWeight _thinWeight = FontWeight.w300;
  static const FontWeight _normalWeight = FontWeight.w400;
  static const FontWeight _boldWeight = FontWeight.w700;

  //

  //?Text Styles go below
  //colorSizeFontWeight
  static TextStyle darkGreySize12 =
      _base(_size12, _normalWeight, AppColors.textDark);

  ///Note: This is the normal text used in the app
  static TextStyle darkGreySize14 =
      _base(_size14, _normalWeight, AppColors.textDark);

  static TextStyle darkGreySize16 = _base(
    _size16,
    _normalWeight,
    AppColors.textDark,
  );

  //Light Grey
  static TextStyle lightGreySize12 =
      _base(_size12, _normalWeight, AppColors.textLight10);

  static TextStyle lightGreySize14 =
      _base(_size14, _normalWeight, AppColors.textLight10);

  static TextStyle lightGreySize16 =
      _base(_size16, _normalWeight, AppColors.textLight10);

  static TextStyle lightGreySize18 =
      _base(_size18, _normalWeight, AppColors.textLight10);

  //very dark text
  static TextStyle darkGreySize14Bold =
      _base(_size14, _boldWeight, AppColors.textDark10);

  static TextStyle darkGreySize16Bold =
      _base(_size16, _boldWeight, AppColors.textDark10);

  static TextStyle darkGreySize18Bold =
      _base(_size18, _boldWeight, AppColors.textDark10);

  static TextStyle blackSize18Bold =
      _base(_size18, _boldWeight, AppColors.textDark10);

  static TextStyle darkGreySize20Bold =
      _base(_size20, _boldWeight, AppColors.textDark10);

  static TextStyle errorSize14 =
      _base(_size14, _normalWeight, AppColors.redColor);

  static TextStyle whiteSize14Bold =
      _base(_size14, _boldWeight, AppColors.whiteColor);

  static TextStyle whiteSize18Bold =
      _base(_size18, _boldWeight, AppColors.whiteColor);

  static TextStyle whiteSize20Bold =
      _base(_size20, _boldWeight, AppColors.whiteColor);

  static TextStyle whiteSize16Bold =
      _base(_size16, _boldWeight, AppColors.whiteColor);

  static TextStyle whiteSize18 =
      _base(_size18, _normalWeight, AppColors.whiteColor);

  static TextStyle whiteSize16 =
      _base(_size16, _normalWeight, AppColors.whiteColor);

  static TextStyle whiteSize14 =
      _base(_size14, _normalWeight, AppColors.whiteColor);

  static TextStyle whiteSize12 =
      _base(_size12, _normalWeight, AppColors.whiteColor);

  static TextStyle blueSize14 =
      _base(_size12, _normalWeight, AppColors.blueTextColor);
  //!End

  //?Write custom test style below
  static TextStyle greenSize14 = _base(
    _size14,
    _normalWeight,
    AppColors.zuriPrimaryColor,
  );

  static TextStyle greenSize16 = _base(
    _size16,
    _normalWeight,
    AppColors.zuriPrimaryColor,
  );

  static TextStyle greenSize20Bold = _base(
    _size16,
    _boldWeight,
    AppColors.zuriPrimaryColor,
  );
  static TextStyle textFieldHint = _base(
    _size16,
    _normalWeight,
    AppColors.textLight10,
  );

  static TextStyle longButtonStyle = _base(
    _size16,
    _normalWeight,
    AppColors.whiteColor,
  );

  static TextStyle bigBlackText = _base(
    24,
    _boldWeight,
    AppColors.textDark10,
  );

  static TextStyle bigWhiteText = _base(
    24,
    _boldWeight,
    AppColors.whiteColor,
  );
  static TextStyle organizationNameText = _base(
    19,
    FontWeight.w800,
    AppColors.whiteColor.withOpacity(0.9),
  );

  static TextStyle zuriAppBarWordLogo = GoogleFonts.lato(
    fontSize: 18.08,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
    height: 1,
    letterSpacing: 2.5,
  );

  static TextStyle header6 = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.zuriTextColorHeader,
    fontSize: 20,
  );

  static TextStyle termAndConditionStyle = GoogleFonts.lato(
    fontSize: 12,
    color: AppColors.zuriPrimaryColor,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.zuriPrimaryColor,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1,
  );

  //
  //#base style
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
    return GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Colors.grey[600],
    );
  }
}
