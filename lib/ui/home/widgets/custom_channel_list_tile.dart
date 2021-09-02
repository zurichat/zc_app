import 'package:flutter/material.dart';

import '../../../utilities/constants/styles.dart';

class CustomChannelListTile extends StatelessWidget {
  final String channelName;
  final Function()? pressed;
  final bool isActive;
  final String data;
  const CustomChannelListTile({
    Key? key,
    this.channelName = '',
    this.pressed,
    this.data='',
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ' # ' + '   '+channelName,
          style: TextStyle(
            color: isActive ? Colors.black : greyishColor,
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        isActive
            ? Container(
              width: 18,
              height: 18,
                decoration: BoxDecoration(color: Color(0xFFB8003C),borderRadius: BorderRadius.circular(4)),
                child: Center(child: Text(data, style: TextStyle(color: whiteColor),)),
              )
            : Container()
      ],
    );
  }
}
