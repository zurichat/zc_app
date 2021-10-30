import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/colors.dart';

class OnlineIndicator extends StatelessWidget {
  const OnlineIndicator(int i, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(5.0),
      child: Icon(
        Icons.circle,
        color: AppColors.zuriPrimaryColor,
        size: 8,
      ),
    );
  }
}
