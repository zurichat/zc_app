import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

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
          hintStyle: AppTextStyles.textButtonText.copyWith(
              decoration: TextDecoration.none, color: AppColors.greyColor)),
    );
  }
}
