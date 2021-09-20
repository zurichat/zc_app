import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

TextStyle headerStyle() {
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: 'Lato',
      color: Colors.black);
}

TextStyle addStyle() {
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lato',
      color: Colors.black);
}


TextStyle lightStyle() {
  return TextStyle(
      fontSize: 16,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      color: AppColors.borderColor);
}

TextStyle nameStyle() {
  return TextStyle(
      fontSize: 14,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
      color: AppColors.deepBlackColor);
}

TextStyle descriptionStyle() {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Lato',
      color: AppColors.deepBlackColor);
}

TextStyle faintTextStyle() {
  return TextStyle(
      fontSize: 14,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w400,
      color: AppColors.borderColor);
}

TextStyle archiveTextStyle() {
  return TextStyle(
      fontFamily: 'Lato',
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.redColor);
}

TextStyle greenTextStyle() {
  return TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.zuriPrimaryColor,
  );
}
