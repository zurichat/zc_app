import 'package:flutter/material.dart';

class CustomChannelStage extends StatelessWidget {
  const CustomChannelStage({Key? key, this.leadingIcon, this.text})
      : super(key: key);
  final leadingIcon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 379,
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            child: Icon(
              leadingIcon,
              size: 16,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
