import 'package:flutter/material.dart';
import 'package:flutter/Cupertino.dart';
import 'package:hng/ui/shared/colors.dart';

TextStyle headerStyle() {
  return TextStyle(
      fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black);
}

TextStyle nameStyle() {
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.deepBlackColor);
}

TextStyle descriptionStyle() {
  return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.deepBlackColor);
}

TextStyle faintTextStyle() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.borderColor);
}

TextStyle archiveTextStyle() {
  return TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.redColor);
}

TextStyle greenTextStyle() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.greenColor,
  );
}
