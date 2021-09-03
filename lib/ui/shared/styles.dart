import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static const TextStyle heading6 = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.greyishColor,
    fontSize: 24,
  );
  static const TextStyle heading5 = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.greyishColor,
    fontSize: 16,
  );
  static const TextStyle body1Regular = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.greyishColor,
    fontSize: 16,
  );
  static const TextStyle body2Medium = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.greyishColor,
    fontSize: 14,
  );
  static const TextStyle body1Bold = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.greyishColor,
    fontSize: 16,
  );
  static const TextStyle body2Bold = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.greyishColor,
    fontSize: 14,
  );

  // button
  static const TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
    fontSize: 16,
  );
}

const logoAsset = AssetImage('assets/logo/hng_logo.png');
const dummyNetworkImage =
    'https://loremflickr.com/320/240/paris,news,work?random=';

const dummyNetworkVideo =
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4';
