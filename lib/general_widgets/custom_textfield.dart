import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import '../ui/shared/colors.dart';
//import 'package:expandable_text/expandable_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    required this.keyboardType,
    required this.inputAction,
    required this.autoCorrect,
    required this.obscureText,
    this.labelText,
    this.hintText,
  }) : super(key: key);
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final TextEditingController? controller;

  final bool? autoCorrect;
  final bool? obscureText;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: inputAction,
      autocorrect: autoCorrect!,
      obscureText: obscureText!,
      cursorColor: AppColors.zuriPrimaryColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        labelText: labelText,
        hintText: hintText,
        hintStyle: AppTextStyle.textFieldHint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: AppColors.zuriPrimaryColor,
          ),
        ),
      ),
    );
  }
}
