import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';

class CustomPluginListTile extends StatelessWidget {
  final String? assetName;
  final String pluginName;
  final Function()? pressed;
  final bool isActive;
  final String? data;
  final IconData? icon;

  const CustomPluginListTile({
    Key? key,
    this.assetName,
    this.icon,
    this.data,
    this.pressed,
    this.isActive = false,
    this.pluginName = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon != null ? 
                Icon(
                  icon,
                  color: isActive ? Colors.black : AppColors.greyishColor,
                  size: 16,
                ) : 
                 Image.asset(
                  assetName!,
                  width: 18,
                ),
              const SizedBox(width: 8),
              Text(
                pluginName,
                style: isActive ? AppTextStyles.unreadText : AppTextStyles.normalText
              ),
            ]
          ),
          isActive
              ? AppTextStyles.unreadCount(
                  int.parse(data!),
                )
              : Container()
        ],
      ),
    );
  }
}
