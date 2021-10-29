import 'package:flutter/material.dart';

import '../../../../../utilities/constants/colors.dart';

TextStyle headerStyle() {
  return const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w800, color: Colors.black);
}

TextStyle nameStyle() {
  return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.deepBlackColor);
}

TextStyle containerTextStyle() {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle descriptionStyle() {
  return const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.deepBlackColor);
}

TextStyle faintTextStyle() {
  return const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.borderColor);
}

TextStyle archiveTextStyle() {
  return const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.redColor);
}

TextStyle greenTextStyle() {
  return const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.zuriPrimaryColor,
  );
}
