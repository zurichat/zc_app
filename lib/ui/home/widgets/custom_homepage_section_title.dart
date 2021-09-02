import 'package:flutter/material.dart';

import '../../../utilities/constants/styles.dart';

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
            fontSize: 16,
          ),
        ),
        
      ],
    );
  }
}
