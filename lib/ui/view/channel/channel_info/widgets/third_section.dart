import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/models/channel_members.dart';
import 'package:zurichat/models/channel_model.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';

import 'package:zurichat/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'package:zurichat/ui/view/channel/channel_info/widgets/new_row_tile.dart';
import '../../../../../utilities/constants/colors.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection(
      this.model, this.numberOfMembers, this.channelDetail, this.channelMembers,
      {Key? key})
      : super(key: key);
  final int numberOfMembers;
  final ChannelModel channelDetail;
  final List<ChannelMembermodel> channelMembers;
  final ChannelInfoViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 284.h,
      width: 395.w,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(16.37.w, 18.h, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkThemePrimaryColor
            : AppColors.whiteColor,
      ),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                model.navigateToMembersList(channelMembers, channelDetail);
              },
              child: NewRowTile(
                  icon: Icons.group_outlined,
                  text: "Members ($numberOfMembers)")),
          SizedBox(height: 10.h),
          Divider(
            thickness: 0.5.h,
            color: AppColors.deepBlackColor.withOpacity(0.5),
            indent: 66.6.w,
            // endIndent: 33,
          ),
          SizedBox(height: 18.h),
          InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    Channel_Info_Members,
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  SizedBox(width: 24.23.w),
                  Text(
                    AddPeople,
                    style: AppTextStyle.darkGreySize14.copyWith(
                      fontSize: 14.sp,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ],
              )),
          SizedBox(height: 10.h),
          Divider(
            thickness: 0.5.h,
            color: AppColors.deepBlackColor.withOpacity(0.5),
            indent: 66.6.w,
            // endIndent: 33,
          ),
          SizedBox(height: 18.h),
          InkWell(
            onTap: () {},
            child: const NewRowTile(
                icon: Icons.dashboard_outlined, text: OnePlugin),
          ),
          SizedBox(height: 10.h),
          Divider(
            thickness: 0.5.h,
            color: AppColors.deepBlackColor.withOpacity(0.5),
            indent: 66.6.w,
            // endIndent: 33,
          ),
          SizedBox(height: 18.h),
          InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset(
                    Channel_Info_Phone,
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  SizedBox(width: 24.23.w),
                  Text(
                    StartCall,
                    style: AppTextStyle.darkGreySize14.copyWith(
                      fontSize: 14.sp,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
