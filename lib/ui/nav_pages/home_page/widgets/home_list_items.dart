import 'package:flutter/material.dart';

class TextAndIcon extends StatelessWidget {
  final String text;
  final int indicatorCount;
  final Widget icon;

  const TextAndIcon({
    Key? key,
    required this.text,
    required this.indicatorCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        
      ],
    );
  }
}
