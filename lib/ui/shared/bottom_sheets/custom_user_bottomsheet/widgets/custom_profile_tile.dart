import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';

class CustomProfileTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomProfileTile(
      {Key? key, required this.title, required this.subtitle, this.onPressed})
      : super(key: key);
  
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(text: title, fontWeight: FontWeight.w300, fontSize: 14.0,),
      subtitle: CustomText(text: subtitle, fontWeight: FontWeight.w500),
      onTap: onPressed,
    );
  }
}