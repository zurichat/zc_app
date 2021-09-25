import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double? padding;
  final TextDecoration decoration;

  const CustomTextWidget(
      {Key? key,
      this.text = '',
      this.fontSize = 16.0,
      this.fontWeight = FontWeight.normal,
      this.color = AppColors.deepBlackColor,
      this.padding,
      this.decoration = TextDecoration.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            decoration: decoration),
      ),
    );
  }
}
