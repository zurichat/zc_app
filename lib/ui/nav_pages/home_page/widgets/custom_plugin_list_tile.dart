import 'package:flutter/material.dart';

<<<<<<< HEAD:lib/ui/home/widgets/custom_plugin_list_tile.dart
=======
import '../../../shared/colors.dart';
>>>>>>> 8c2daffa075fb0a2e41e9392d30152adcb3f39c7:lib/ui/nav_pages/home_page/widgets/custom_plugin_list_tile.dart

import '../../shared/colors.dart';
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
          color: AppColors.greyishColor,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          pluginName,
          style: const TextStyle(
            color: AppColors.greyishColor,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
