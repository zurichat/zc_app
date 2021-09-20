import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

Widget customAppBar() {
  return AppBar(
    actions: [
      GestureDetector(
        onTap: () {},
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.0, vertical: 19),
            child: Icon(
              Icons.star,
              color: AppColors.zuriPrimaryColor,
            )),
      )
    ],
    backgroundColor: Colors.white,
    title: Text(
      'Channel Info',
      style: AppTextStyles.heading5,
    ),
  );
}
