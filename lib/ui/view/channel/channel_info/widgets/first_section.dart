import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import '../../../../shared/colors.dart';

class FirstSection extends StatelessWidget {
  FirstSection(this.model);
  final ChannelInfoViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(width: 1.w, color: AppColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5.r,
              blurRadius: 6.r,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      padding: EdgeInsets.fromLTRB(16.37.w, 24.h, 24.h,16.37.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 30),
            child: Text(
              // "$channelName",
              "${model.channelName}",
              style: AppTextStyles.body1Light,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 19,
            ),
            child: Text(
              'Description',
              style: AppTextStyles.body1Light,
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 15,
            ),
            child: Text(
              '${model.channelDescription}',
              style: AppTextStyles.body1Light.copyWith(letterSpacing:0.005 ),
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 19,
            ),
            child: Text(
              'Mark created this channel on August 13.',
              style: AppTextStyles.body1Regular.copyWith(letterSpacing:0.005 ),
            ),
          ),
          SizedBox(height: 18.h),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 15,
            ),
            child: Text(
              'Topic',
              style: AppTextStyles.headerStyle1,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
              'Creating the zuri main app',
              style: AppTextStyles.body1Light,
            ),
          SizedBox(height: 26.h),
          Divider(thickness: 0.5.h, color: AppColors.borderColor,),
          SizedBox(height: 16.h),
          Center(
            child: Text(
              'Edit',
              style: AppTextStyles.bodyBig,
            ),
          ),
        ],
      ),
    );
  }
}
