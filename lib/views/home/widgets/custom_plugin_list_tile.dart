import 'package:flutter/material.dart';

import '../../../utilities/constants/styles.dart';

class CustomPluginListTile extends StatelessWidget {
  final IconData? icon;
  final String pluginName;
  const CustomPluginListTile({
    Key? key,
    this.icon,
    this.pluginName = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: greyishColor,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          pluginName,
          style: const TextStyle(
            color: greyishColor,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
