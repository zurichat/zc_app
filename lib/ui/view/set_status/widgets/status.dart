import 'package:flutter/material.dart';

import '../../../../general_widgets/menu_item_tile.dart';
import '../../../shared/colors.dart';

class Status extends StatelessWidget {
  const Status(
      {Key? key,
      required this.status,
      required this.duration,
      required this.icon})
      : super(key: key);
  final String status;
  final String duration;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: MenuItemTile(
        topBorder: false,
        icon: Icon(icon),
        text: Text.rich(TextSpan(
            text: status,
            style: const TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: ' - $duration',
                  style: const TextStyle(color: AppColors.greyishColor))
            ])),
      ),
    );
  }
}
