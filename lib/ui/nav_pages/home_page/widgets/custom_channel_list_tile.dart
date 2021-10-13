import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/shared.dart';

class CustomChannelListTile extends StatelessWidget {
  final String channelName;
  final Function()? pressed;
  final bool isActive;
  final String? data;

  const CustomChannelListTile({
    Key? key,
    this.channelName = '',
    this.pressed,
    this.data,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(hash + '   ' + channelName,
            style:
                isActive ? AppTextStyles.unreadText : AppTextStyles.normalText),
        isActive ? AppTextStyles.unreadCount(int.parse(data!)) : Container()
      ],
    );
  }
}
