import 'package:flutter/material.dart';

class CustomChannelStage extends StatelessWidget {
  const CustomChannelStage({Key? key, this.leadingIcon, this.text})
      : super(key: key);
  final leadingIcon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 211,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3,0,0,0),
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
            const SizedBox(width: 18),
            Text(
              text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
