import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

TextStyle headerStyle() {
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.zuriTextColorHeader);
}

TextStyle nameStyle() {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.zuriTextColorHeader);
}

TextStyle descriptionStyle() {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.zuriTextColorHeader);
}

TextStyle faintTextStyle() {
  return TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.greyishColor);
}

TextStyle archiveTextStyle() {
  return TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.redColor);
}

TextStyle greenTextStyle() {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.zuriPrimaryColor,
  );
}
