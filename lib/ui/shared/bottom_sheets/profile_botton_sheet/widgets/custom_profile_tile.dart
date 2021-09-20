import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';

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
      title: CustomText(text: title, fontWeight: FontWeight.w300),
      subtitle: CustomText(text: subtitle, fontWeight: FontWeight.w500),
      onTap: onPressed,
    );
  }
}
