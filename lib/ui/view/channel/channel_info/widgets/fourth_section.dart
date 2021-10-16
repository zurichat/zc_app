import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'new_row_tile.dart';

class FourthSection extends StatelessWidget {
  const FourthSection(this.model, {Key? key}) : super(key: key);
  final ChannelInfoViewModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: model.navigateToPinnedMessages,
      child: Card(
        elevation: 2,
        child: Container(
            height: 53.h,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(18.w, 16.h, 0, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: const NewRowTile(
                icon: Icons.push_pin_outlined, text: PinnedMessages)),
      ),
    );
  }
}