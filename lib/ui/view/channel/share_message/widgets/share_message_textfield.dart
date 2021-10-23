import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';

class ShareMessageTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;

  const ShareMessageTextField(
      {Key? key,
      required this.controller,
      required this.onChanged,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
          labelText: '',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.zuriPrimaryColor)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.dividerColor)),
          hintText: hintText,
          hintStyle: AppTextStyle.lightGreySize16),
    );
  }
}
