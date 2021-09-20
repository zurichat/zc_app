import 'package:flutter/material.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:hng/ui/shared/colors.dart';

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
        icon: icon,
        text: Text.rich(TextSpan(
            text: status,
            style: TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: " - $duration",
                  style: TextStyle(color: AppColors.greyishColor))
            ])),
      ),
    );
  }
}
