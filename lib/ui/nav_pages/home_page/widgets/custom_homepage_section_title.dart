import 'package:flutter/material.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';

class CustomHomePageSectionTitle extends StatelessWidget {
  final String? title;
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
          child: Text(
            "$title",
            style: AppTextStyle.darkGreySize12,
          ),
        ),
      ],
    );
  }
}
