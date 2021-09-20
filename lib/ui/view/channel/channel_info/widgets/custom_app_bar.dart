import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

Widget customAppBar() {
  return AppBar(
    actions: [
      GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0, vertical: 19),
            child: SvgPicture.asset(
              'assets/channel_page/star.svg',
              width: 20,
            ),
          ))
    ],
    backgroundColor: Colors.white,
    title: Text(
      'Channel Info',
      style: AppTextStyles.heading5,
    ),
  );
}
