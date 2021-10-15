import 'package:flutter/material.dart';
import 'package:hng/ui/shared/text_styles.dart';

class CustomProfileTile extends StatelessWidget {
  const CustomProfileTile(
      {Key? key, required this.title, required this.subtitle, this.onPressed})
      : super(key: key);
  final String title;
  final String subtitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyle.darkGreySize16,
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyle.darkGreySize16,
      ),
      onTap: onPressed,
    );
  }
}
