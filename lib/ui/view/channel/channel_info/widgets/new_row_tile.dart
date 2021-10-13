import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zurichat/ui/shared/shared.dart';

class NewRowTile extends StatelessWidget {
  const NewRowTile({
    Key? key,
    this.icon,
    this.text,
  }) : super(key: key);

  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.deepBlackColor,
          size: 24.sp,
        ),
        SizedBox(width: 24.23.w),
        Text(
          "$text",
          style: AppTextStyles.namesStyle.copyWith(fontSize: 14.sp),
        ),
      ],
    );
  }
}
