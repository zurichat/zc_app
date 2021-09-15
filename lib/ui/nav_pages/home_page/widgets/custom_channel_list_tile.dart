import 'package:flutter/material.dart';
import 'package:hng/ui/shared/styles.dart';

import '../../../shared/colors.dart';

class CustomChannelListTile extends StatelessWidget {
  final String channelName;
  final Function()? pressed;
  final bool isActive;
  final String data;
  const CustomChannelListTile({
    Key? key,
    this.channelName = '',
    this.pressed,
    this.data = '',
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ' # ' + '   ' + channelName,
          style: TextStyle(
            color: isActive ? Colors.black : AppColors.greyishColor,
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        isActive
            ? AppTextStyles.unreadCount(
                int.parse(data),
              )
            : Container()
      ],
    );
  }
}
