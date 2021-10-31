import 'package:flutter/material.dart';

import '../../../utilities/constants/colors.dart';
import '../../../utilities/enums.dart';

class ChannelIcon extends StatelessWidget {
  const ChannelIcon({required this.channelType, this.color, Key? key})
      : super(key: key);

  final ChannelType channelType;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    switch (channelType) {
      case ChannelType.private:
        return Icon(
          Icons.lock,
          size: 14,
          color: color,
        );
      case ChannelType.public:
        return Icon(
          Icons.tag,
          size: 14,
          color: color,
        );

      case ChannelType.personal:
        return Icon(
          Icons.circle,
          size: 14,
          color: color ?? AppColors.zuriPrimaryColor,
        );

      default:
        return const Icon(null);
    }
  }
}
