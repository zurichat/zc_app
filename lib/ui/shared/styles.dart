import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  static TextStyle heading9 = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
    fontSize: 16,
  );
  static TextStyle heading8 = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    color: AppColors.zuriPrimaryColor,
    fontSize: 16,
  );
  static TextStyle heading7 = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
    fontSize: 20,
  );
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
    fontSize: 12,
  );
  static TextStyle body3Medium = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    color: AppColors.greyishColor,
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
    color: AppColors.blackColor,
    fontSize: 12,
  );

  static TextStyle unreadTextCount = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
    fontSize: 12,
  );
  static TextStyle subtitle = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
    fontSize: 12,
  );
  static TextStyle normalGrey = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
    fontSize: 14,
  );
  static TextStyle fileName = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
    fontSize: 14,
  );
  static TextStyle unselectedLabelText = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.greyColor,
    fontSize: 16,
  );
  static TextStyle labelText = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreyColor,
    fontSize: 16,
  );

  static TextStyle zuriAppBarWordLogo = TextStyle(
    fontSize: 18.08,
    fontFamily: 'Lato',
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
    height: 1,
    letterSpacing: 2.5
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
        child: Text(count.toString(), style: AppTextStyles.unreadTextCount),
      ),
    );
  }

  // button
  static TextStyle buttonText = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
    fontSize: 16,
  );
  static const TextStyle textButtonText = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.blueColor,
    decoration: TextDecoration.underline,
  );
}

const logoAsset = AssetImage('assets/logo/hng_logo.png');
const dummyNetworkImage =
    'https://loremflickr.com/320/240/paris,news,work?random=';

const dummyNetworkVideo =
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4';
