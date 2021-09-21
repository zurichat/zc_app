import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/shared/styles.dart';

class CustomChannelStage extends StatelessWidget {
  const CustomChannelStage({Key? key, this.leadingIcon, this.text})
      : super(key: key);
  final leadingIcon;
  final text;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 823),
      builder: () => InkWell(
        onTap: () {},
        child: Container(
          height: 24.h,
          width: 211.w,
          child: Padding(
            padding: EdgeInsets.fromLTRB(3.w,0,0,0),
            child: Row(
              children: [
                Container(
                  height: 16.h,
                  width: 16.w,
                  child: Icon(
                    leadingIcon,
                    size: 16.sp,
                  ),
                ),
                SizedBox(width: 18.w),
                Text(
                  text,
                  style: AppTextStyles.fileName, // textfont in here won't scale to different screens
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
