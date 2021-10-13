import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/new_row_tile.dart';
import '../../../../shared/colors.dart';

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
    return Card(
      elevation: 2,
      child: Container(
        height: 200.h,
        width: 395.w,
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(16.37.w, 18.h, 0, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
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
                onTap: () => model.navigateToAddMembers(),
                child: const NewRowTile(
                    icon: Icons.person_add_alt_1_outlined, text: AddPeople)),
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
                    icon: Icons.phone_outlined, text: StartCall)),
          ],
        ),
      ),
    );
  }
}
