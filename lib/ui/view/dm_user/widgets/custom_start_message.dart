import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';

class StartMessage extends StatelessWidget {
  final String? userName;

  const StartMessage(String username, {
    Key? key,
    //TODO assign to app_strings.dart
    this.userName = 'OyinkanUA',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: CustomStartMsg1,
        style: const TextStyle(
          color: Color(0xFF808080),
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: '$userName. ',
            style: const TextStyle(color: AppColors.zuriPrimaryColor),
          ),
          const TextSpan(
            text: CustomStartMsgTwo,
          )
        ],
      ),
    );
  }
}
