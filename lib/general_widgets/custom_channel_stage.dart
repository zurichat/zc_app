import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/shared/styles.dart';

class CustomChannelStage extends StatelessWidget {
  final IconData? leadingIcon;
  final String? text;

  const CustomChannelStage({Key? key, this.leadingIcon, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: SizedBox(
          height: 24.h,
          width: 211.w,
          child: Padding(
            padding: EdgeInsets.fromLTRB(3.w, 0, 0, 0),
            child: Row(
              children: [
                SizedBox(
                  height: 16.h,
                  width: 16.w,
                  child: Icon(
                    leadingIcon,
                    size: 16.sp,
                  ),
                ),
                SizedBox(width: 18.w),
                Text(
                  '$text',
                  style: AppTextStyles.fileName,
                  // textfont in here won't scale to different screens
                ),
              ],
            ),
          ),
        ),
    );
  }
}