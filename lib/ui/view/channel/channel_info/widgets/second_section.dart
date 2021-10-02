import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/shared/shared.dart';
import '../../../../shared/colors.dart';

class SecondSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.h,
      width: 395.w,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(16.37.w, 24.h, 26.h,16.37.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(width: 1.w, color: AppColors.borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5.r,
              blurRadius: 6.r,
              offset: Offset(0, 3.h), // changes position of shadow
            ),
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 78.h,
            width: 279.03.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  color: AppColors.deepBlackColor,
                  size: 24.sp,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Text(
                        'Notification',
                        style: AppTextStyles.namesStyle.copyWith(fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    InkWell(
                      onTap: (){},
                      child: Text(
                        'Every New Message',
                        style: AppTextStyles.body1Grey.copyWith(fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    InkWell(
                      onTap: (){},
                      child: Text(
                        'Mute Channel',
                        style: AppTextStyles.descriptionStyle..copyWith(fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.toggle_off_sharp,
                      color: AppColors.faintTextColor,
                      size: 40.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
