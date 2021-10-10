
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/ui/shared/styles.dart';

class CustomChannel extends StatelessWidget {
  final String? text;
  final bool lock;
  const CustomChannel({Key? key, this.text, this.lock = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      width: 211.w,
      child: Padding(
        padding: EdgeInsets.fromLTRB(5.w, 0, 0, 0),
        child: Row(
          children: [
            SizedBox(
              height: 16.r,
              width: 16.r,
              child: lock == true ?
              SvgPicture.asset(
                  'assets/icons/svg_icons/lock_outline.svg',
              ) :
              SvgPicture.asset(
                'assets/icons/svg_icons/hash_tag.svg',
              )
            ),
            SizedBox(width: 21.33.w),
            Text(
              '$text',
              style: AppTextStyles.nameStyle1.copyWith(fontSize: 14.sp)
            ),
          ],
        ),
      ),
    );
  }
}