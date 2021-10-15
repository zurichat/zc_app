import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/text_styles.dart';

class UnreadCount extends StatelessWidget {
  final int count;
  const UnreadCount({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.unreadMessageColor,
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: AppTextStyle.whiteSize12,
        ),
      ),
    );
  }
}
