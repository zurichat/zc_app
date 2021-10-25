import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/colors.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/enums.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.text, required this.onPressed, this.icon})
      : _customButtonType = CustomUserProfileButtonType.normal,
        super(key: key);

  const CustomButton.icon(
      {Key? key, this.text, required this.onPressed, required this.icon})
      : _customButtonType = CustomUserProfileButtonType.icon,
        super(key: key);

  final String? text;
  final IconData? icon;
  final void Function() onPressed;
  final CustomUserProfileButtonType _customButtonType;

  @override
  Widget build(BuildContext context) {
    return _customButtonType == CustomUserProfileButtonType.normal
        ? MaterialButton(
            minWidth: (MediaQuery.of(context).size.width * 0.8),
            onPressed: onPressed,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            shape: Border.all(color: AppColors.greyishColor),
            child: Text(
              " $text",
              style: Theme.of(context).brightness == Brightness.dark
                  ? AppTextStyle.whiteSize14
                  : AppTextStyle.lightGreySize14,
            ))
        : MaterialButton(
            onPressed: onPressed,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
            shape: Border.all(color: AppColors.greyishColor),
            child: Icon(
              icon,
              color: AppColors.greyishColor,
            ),
          );
  }
}
