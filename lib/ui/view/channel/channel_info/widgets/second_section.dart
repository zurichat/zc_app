import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/shared.dart';
import '../../../../shared/colors.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.h,
      width: 395.w,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(16.37.w, 24.h, 26.h, 16.37.w),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkThemePrimaryColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 88.h,
            width: 279.03.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  size: 24.sp,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        Notifications,
                        style:
                            AppTextStyles.namesStyle.copyWith(fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        EveryNewMessage,
                        style:
                            AppTextStyles.body1Grey.copyWith(fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(height: 18.h),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        MuteChannel,
                        style: AppTextStyles.descriptionStyle
                            .copyWith(fontSize: 14.sp),
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
