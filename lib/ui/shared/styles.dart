import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  static TextStyle heading6 = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.greyishColor,
    fontSize: 24,
  );
  static TextStyle heading5 = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    color: AppColors.greyishColor,
    fontSize: 16,
  );
  static TextStyle body1Regular = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.greyishColor,
    fontSize: 16,
  );
  static TextStyle normalText = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static TextStyle body2Medium = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    color: AppColors.greyishColor,
    fontSize: 14,
  );
  static TextStyle body1Bold = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.deepBlackColor,
    fontSize: 16,
  );
  static TextStyle body2Bold = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.greyishColor,
    fontSize: 14,
  );
  static TextStyle timestamp = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.deepBlackColor,
    fontSize: 12,
  );
  static TextStyle unreadText = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
    fontSize: 12,
  );

  // unread count
  static Widget unreadCount(int count) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.unreadMessageColor,
      ),
      child: Center(
        child: Text(count.toString(), style: AppTextStyles.unreadText),
      ),
    );
  }

  // button
  static TextStyle buttonText = GoogleFonts.lato(
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
