import 'package:flutter/material.dart';
import '../../styles.dart';

class CustomHomePageSectionTitle extends StatelessWidget {
  final title;

  const CustomHomePageSectionTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: deepBlackColor,
            fontSize: 15,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.add_circle_outline,
              color: greyishColor,
              size: 18,
            ),
            const SizedBox(width: 16),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: greyishColor,
              size: 18,
            ),
          ],
        )
      ],
    );
  }
}
