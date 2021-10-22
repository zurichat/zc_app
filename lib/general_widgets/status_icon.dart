import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';

class StatusIcon extends StatelessWidget {
  int count = 5;

  StatusIcon(this.count, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColors.iconBlueColor,
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: AppTextStyle.whiteSize12,
        ),
      ),
    );
  }
}
