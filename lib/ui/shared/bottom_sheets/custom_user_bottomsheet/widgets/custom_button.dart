import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/shared.dart';
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
            onPressed: onPressed,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            shape: Border.all(color: AppColors.greyishColor),
            child: Text(
              " $text",
              style: AppTextStyles.body3Medium,
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
