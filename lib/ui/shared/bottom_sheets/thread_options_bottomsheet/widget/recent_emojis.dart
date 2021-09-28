import 'package:flutter/material.dart';

import '../../../colors.dart';

class RecentEmojis extends StatelessWidget {
  const RecentEmojis(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(fontSize: 25),
          )),
      decoration:const  BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.greyBackgroundColor,
      ),
    );
  }
}
