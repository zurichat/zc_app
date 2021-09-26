import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/styles.dart';
import '../channel_page_viewmodel.dart';

class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  final String channelName;
  final int? numberOfMembers;
  final double appBarHeight;
  final List<ChannelMembermodel>? channelMembers;
  final ChannelPageViewModel model;
  ChannelModel? channelDetail;

  CustomAppBars(
      {Key? key,
      required this.channelName,
      required this.numberOfMembers,
      this.channelDetail,
      this.channelMembers,
      this.appBarHeight = 56,
      required this.model})
      : preferredSize = Size.fromHeight(appBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              channelName,
              style: AppTextStyles.header6,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: Text(
              '$numberOfMembers members',
              style: AppTextStyles.body2_400,
            ),
          ),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
            height: 16.0,
            width: 16.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 16.0),
              onPressed: () {
                /*if (appbarAction == 'Edit') {
                  model.nToHome();
                } else {
                  Navigator.of(context).pop();
                }*/
              },
            )),
      ),
      leadingWidth: 40,
      elevation: 1.0,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                CupertinoIcons.search,
                color: AppColors.deepBlackColor,
                size: 22.0,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              // model.navigateToChannelInfoScreen(
              //     numberOfMembers, channelMembers, channelDetail);
            },
            child: SvgPicture.asset(
              'assets/channel_page/info.svg',
              width: 24,
            ),
          ),
        ),
      ],
    );
  }
}
