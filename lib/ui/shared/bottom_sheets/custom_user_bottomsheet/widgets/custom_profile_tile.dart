import 'package:flutter/material.dart';

import '../../../../../utilities/constants/text_styles.dart';

class CustomProfileTile extends StatelessWidget {
  const CustomProfileTile(
      {Key? key, required this.title, required this.subtitle, this.onPressed})
      : super(key: key);
  final String title;
  final String subtitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      visualDensity: const VisualDensity(horizontal: 0.0, vertical: 0),
      horizontalTitleGap: 0,
      dense: true,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Text(
          title,
          style: dark ? AppTextStyle.whiteSize16 : AppTextStyle.darkGreySize16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: dark ? AppTextStyle.whiteSize16 : AppTextStyle.darkGreySize16,
      ),
      onTap: onPressed,
    );
  }
}
