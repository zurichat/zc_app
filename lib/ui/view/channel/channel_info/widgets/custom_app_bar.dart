import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

Widget customAppBar(model) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
          Icons.clear,
        size: 24.sp,
      ),
      onPressed: () => model.navigateBack(),
    ),
    actions: [
      Icon(
        Icons.star,
        color: AppColors.zuriPrimaryColor,
        size: 24.sp,
      )
    ],
    backgroundColor: Colors.white,
    title: Text(
      'Channel Info',
      style: AppTextStyles.appBarTextStyle,
    ),
  );
}
