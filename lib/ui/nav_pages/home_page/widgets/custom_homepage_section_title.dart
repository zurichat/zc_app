import 'package:flutter/material.dart';

<<<<<<< HEAD:lib/ui/home/widgets/custom_homepage_section_title.dart
=======
import '../../../shared/colors.dart';
>>>>>>> 8c2daffa075fb0a2e41e9392d30152adcb3f39c7:lib/ui/nav_pages/home_page/widgets/custom_homepage_section_title.dart

import '../../shared/colors.dart';
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
            color: AppColors.deepBlackColor,
            fontSize: 15,
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.add_circle_outline,
              color: AppColors.greyishColor,
              size: 18,
            ),
            const SizedBox(width: 16),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.greyishColor,
              size: 18,
            ),
          ],
        )
      ],
    );
  }
}
