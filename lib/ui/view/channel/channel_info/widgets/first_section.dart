import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import '../../../../shared/colors.dart';

class FirstSection extends StatelessWidget {
  const FirstSection(this.model, {Key? key}) : super(key: key);
  final ChannelInfoViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: AppColors.whiteColor,
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ]),
      // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16.37.w, 24.h, 8.w, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#${model.channelName}",
                  style: AppTextStyles.body1Bold,
                ),
                SizedBox(height: 24.h),
                Text(
                  Description,
                  style: AppTextStyles.body1Bold.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                Text(
                  '${model.channelDescription}',
                  style: AppTextStyles.body1Light.copyWith(letterSpacing: 0.005.sp, fontSize: 14.sp),
                ),
                SizedBox(height: 6.h),
                Text(
                  MarkCreatedChannel,
                  style: AppTextStyles.body1Regular.copyWith(letterSpacing: 0.005.sp, fontSize: 14.sp),
                ),
                SizedBox(height: 18.h),
                Text(
                  Topic,
                  style: AppTextStyles.headerStyle1.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                Text(
                  CreatingZuri,
                  style: AppTextStyles.body1Light.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 26.h),
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
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
                style: AppTextStyles.bodyBig.copyWith(fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(height: 16.h)
        ],
      ),
    );
  }
}
