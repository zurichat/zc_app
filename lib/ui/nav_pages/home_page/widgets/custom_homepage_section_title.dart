import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class CustomHomePageSectionTitle extends StatelessWidget {
  final title;
  final void Function()? ontap;

  const CustomHomePageSectionTitle({
    Key? key,
    this.title,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: ontap,
          child: const Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.deepBlackColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}