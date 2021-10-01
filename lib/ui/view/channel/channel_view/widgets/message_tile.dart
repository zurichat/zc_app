import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

class MessageTile extends StatelessWidget {
  final String message, avatar, name, time;

  const MessageTile(
      {required this.message,
      required this.avatar,
      required this.name,
      required this.time,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Image.asset(avatar),
        subtitle: Text(message),
        title: Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.deepBlackColor,
              ),
            ),
            const SizedBox(width: 10),
            Text(time, style: AppTextStyles.smallText),
          ],
        ),
      );
}
