import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class CustomChannelListTile extends StatelessWidget {
  final String channelName;

  const CustomChannelListTile({
    Key? key,
    this.channelName = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '#',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 18,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          channelName,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.greyishColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
