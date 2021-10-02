import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import '../../../../shared/colors.dart';

class FirstSection extends StatelessWidget {
  const FirstSection(this.model, {Key? key}) : super(key: key);
  final ChannelInfoViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 284.h,
      width: 395.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(width: 1.w, color: AppColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5.r,
              blurRadius: 6.r,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      padding: EdgeInsets.fromLTRB(16.37.w, 24.h, 24.h, 16.37.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // "$channelName",
            "#${model.channelName}",
            style: AppTextStyles.body1Light,
          ),
          Text(
            Description,
            style: AppTextStyles.body1Light,
          ),
          SizedBox(height: 24.h),
          Text(
            '${model.channelDescription}',
            style: AppTextStyles.body1Light.copyWith(letterSpacing: 0.005),
          ),
          SizedBox(height: 6.h),
          Text(
            MarkCreatedChannel,
            style: AppTextStyles.body1Regular.copyWith(letterSpacing: 0.005),
          ),
          SizedBox(height: 18.h),
          Text(
            Topic,
            style: AppTextStyles.headerStyle1.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 10.h),
          Text(
            CreatingZuri,
            style: AppTextStyles.body1Light.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 26.h),
          Divider(
            thickness: 0.5.h,
            color: AppColors.borderColor,
          ),
          SizedBox(height: 16.h),
          Center(
            child: InkWell(
              onTap: () {
                model.navigateToEditChannel();
              },
              child: Text(
                Edit,
                style: AppTextStyles.bodyBig..copyWith(fontSize: 16.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
