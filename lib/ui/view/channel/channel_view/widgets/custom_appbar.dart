import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

import '../channel_page_viewmodel.dart';

class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  final String channelName;
  final String numberOfMembers;
  final double appBarHeight;
  final ChannelPageViewModel model;

  CustomAppBars(
      {Key? key,
      required this.channelName,
      required this.numberOfMembers,
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
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: AppColors.deepBlackColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            child: Text(
              '$numberOfMembers members',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: AppColors.deepBlackColor,
              ),
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
              model.navigateToChannelInfo();
            },
            child: const Icon(
              CupertinoIcons.info,
              color: AppColors.deepBlackColor,
              size: 29.0,
            ),
          ),
        ),
      ],
    );
  }
}

AppBar appBar(String text, /*Function()? pressed,*/ String nexttext,
    BuildContext context) {
  return AppBar(
    elevation: 1,
    backgroundColor: AppColors.whiteColor,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        CupertinoIcons.back,
        color: AppColors.deepBlackColor,
      ),
    ),
    title: Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: AppColors.deepBlackColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              nexttext,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: AppColors.deepBlackColor,
              ),
            ),
          ],
        ),
      ],
    ),
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
          onTap: () {}, //pressed,
          child: const Icon(
            CupertinoIcons.info,
            color: AppColors.deepBlackColor,
            size: 29.0,
          ),
        ),
      ),
    ],
  );
}
