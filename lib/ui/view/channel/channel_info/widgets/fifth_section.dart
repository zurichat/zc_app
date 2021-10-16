import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import '../../../../shared/colors.dart';

class FifthSection extends StatelessWidget {
  const FifthSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 53.h,
        width: 395.w,
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(16.37.w, 18.h, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          // border: Border.all(width: 1.w, color: AppColors.borderColor),
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkThemePrimaryColor
              : AppColors.whiteColor,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              Log_Out,
              color: Theme.of(context).textTheme.bodyText1!.color,
              width: 18,
              height: 18,
            ),
            SizedBox(width: 24.23.w),
            Text(
              Leave,
              style: AppTextStyle.darkGreySize16.copyWith(
                fontSize: 14.sp,
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}