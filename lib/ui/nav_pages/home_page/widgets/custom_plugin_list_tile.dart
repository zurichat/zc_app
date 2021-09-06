import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

class CustomPluginListTile extends StatelessWidget {
  final IconData? icon;
  final String pluginName;
  final Function()? pressed;
  final bool isActive;
  final String data;
  const CustomPluginListTile({
    Key? key,
    this.icon,
    this.data = '',
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
              Icon(
                icon,
                color:isActive?Colors.black: AppColors.greyishColor,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                pluginName,
                style: TextStyle(
                  color: isActive?Colors.black:AppColors.greyishColor,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          isActive
            ? Container(
              width: 18,
              height: 18,
                decoration: BoxDecoration(color: Color(0xFFB8003C),borderRadius: BorderRadius.circular(4)),
                child: Center(child: Text(data, style: TextStyle(color: AppColors.whiteColor),)),
              )
            : Container()
        ],
      ),
    );
  }
}
