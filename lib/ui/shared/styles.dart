import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  static TextStyle heading9 = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    // color: AppColors.blackColor,
    fontSize: 16,
  );
  static TextStyle heading8 = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    color: AppColors.zuriPrimaryColor,
    fontSize: 16,
  );
  static TextStyle heading7 = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    // color: AppColors.blackColor,
    fontSize: 20,
  );
  static TextStyle hashtag = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
    fontSize: 20,
  );
  static TextStyle heading6 = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    // color: AppColors.greyishColor,
    fontSize: 24,
  );
  static TextStyle heading5 = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    color: AppColors.greyishColor,
    fontSize: 16,
  );
  static TextStyle heading4 = GoogleFonts.lato(
    fontWeight: FontWeight.w600,
    // color: AppColors.blackColor,
    fontSize: 18,
  );
  static TextStyle body1Regular = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.greyishColor,
    fontSize: 16,
  );
  static TextStyle bodyRegular = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    // color: AppColors.blackColor,
    fontSize: 20,
  );
  static TextStyle normalText = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
  static TextStyle messageText = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    // color: AppColors.blackColor,
  );

  static TextStyle textButton1 = GoogleFonts.lato(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.blueTextColor,
  );
  static TextStyle messageTextButton = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.blueTextColor,
  );
  static TextStyle body3Medium = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    // color: AppColors.greyishColor,
    fontSize: 14,
  );
  static TextStyle faintBodyText = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    // color: AppColors.greyColor,
    fontSize: 14,
  );
  static TextStyle body2Medium = GoogleFonts.lato(
    fontWeight: FontWeight.w500,
    color: AppColors.greyishColor,
    fontSize: 14,
  );
  static TextStyle body1Bold = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    // color: AppColors.deepBlackColor
  );

  static TextStyle body1 = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static TextStyle regular = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreyColor,
    fontSize: 18,
  );
  static TextStyle body1Green = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.zuriPrimaryColor,
    fontSize: 16,
  );
  static TextStyle body2Bold = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    // color: AppColors.greyishColor,
    fontSize: 14,
  );
  static TextStyle body2_400 = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.zuriDarkGrey,
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

  static TextStyle lastSeen = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );

  static TextStyle subtitle = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
    fontSize: 12,
  );
  static TextStyle subtitle1 = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.deepGreyColor,
    fontSize: 12,
  );
  static TextStyle normalGrey = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
    fontSize: 14,
  );
  static TextStyle normal = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
    fontSize: 16,
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

  static TextStyle zuriAppBarWordLogo = GoogleFonts.lato(
      fontSize: 18.08,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteColor,
      height: 1,
      letterSpacing: 2.5);

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
  static TextStyle header6 = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.zuriTextColorHeader,
    fontSize: 20,
  );
  static TextStyle body1Light = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.zuriTextColorHeader,
    fontSize: 16,
  );
  static TextStyle body1Grey = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.greyishColor,
    fontSize: 14,
  );
  static TextStyle nameStyle = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.darkGreyColor,
    fontSize: 14,
  );
  static TextStyle nameStyle1 = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.deepGreyColor,
    fontSize: 14,
  );
  static TextStyle hintStyle = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.searchHintColor,
    fontSize: 14,
  );
  static TextStyle smallText = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.zuriGrey,
    fontSize: 12,
  );
  static TextStyle smallTextGrey = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.zuriDarkGrey,
    fontSize: 12,
  );
  static TextStyle mediumText = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.zuriGrey,
    fontSize: 16,
  );
  static TextStyle bodySmall = GoogleFonts.lato(
    fontWeight: FontWeight.w400,
    color: AppColors.zuriPrimaryColor,
    fontSize: 14,
  );
  static TextStyle bodyBig = GoogleFonts.lato(
    fontWeight: FontWeight.w700,
    color: AppColors.zuriPrimaryColor,
    fontSize: 16,
  );

  static TextStyle appBarTextStyle = GoogleFonts.lato(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.zuriTextColorHeader);

  static TextStyle headerStyle = GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.zuriTextColorHeader);

  static TextStyle headerStyle1 = GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.zuriTextColorHeader);

  static TextStyle namesStyle = GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.zuriTextColorHeader);

  static TextStyle descriptionStyle = GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.zuriTextColorHeader);

  static TextStyle archiveTextStyle = GoogleFonts.lato(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.unreadMessageColor);

  static TextStyle archiveTextStyle2 = GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.unreadMessageColor);
}

class StatusIcon extends StatelessWidget {
  int count = 5;

  StatusIcon(this.count, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColors.iconBlueColor,
      ),
      child: Center(
        child: Text(count.toString(), style: AppTextStyles.unreadTextCount),
      ),
    );
  }
}

const logoAsset = AssetImage('assets/logo/hng_logo.png');
const dummyNetworkImage =
    'https://loremflickr.com/320/240/paris,news,work?random=';

const dummyNetworkVideo =
    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4';
