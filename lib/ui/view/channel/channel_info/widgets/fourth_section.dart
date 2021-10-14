import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import '../../../../shared/colors.dart';

class FourthSection extends StatelessWidget {
  const FourthSection(this.model, {Key? key}) : super(key: key);
  final ChannelInfoViewModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: model.navigateToPinnedMessages,
      child: Container(
          height: 53.h,
          width: 395.w,
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(16.37.w, 18.h, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkThemePrimaryColor
                : AppColors.whiteColor,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                pinned_message,
                color: AppColors.darkGreyColor,
                width: 18,
                height: 18,
              ),
              SizedBox(width: 24.23.w),
              Text(
                PinnedMessages,
                style: AppTextStyles.namesStyle.copyWith(
                  fontSize: 14.sp,
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ],
          )),
    );
  }
}
