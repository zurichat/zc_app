import 'package:flutter/material.dart';

<<<<<<< HEAD:lib/ui/home/widgets/custom_channel_list_tile.dart
import '../../shared/colors.dart';
=======
import '../../../shared/colors.dart';
>>>>>>> 8c2daffa075fb0a2e41e9392d30152adcb3f39c7:lib/ui/nav_pages/home_page/widgets/custom_channel_list_tile.dart

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
