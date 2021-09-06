import 'package:flutter/material.dart';

import '../ui/shared/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.keyboardType,
    this.inputAction,
    this.autoFocus,
    this.autoCorrect,
    this.obscureText,
    this.labelText,
    this.hintText,
  }) : super(key: key);
  final keyboardType;
  final inputAction;
  final bool? autoFocus;
  final bool? autoCorrect;
  final bool? obscureText;
  final String? labelText;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      textInputAction: inputAction,
      autofocus: autoFocus!,
      autocorrect: autoCorrect!,
      obscureText: obscureText!,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: AppColors.zuriTextBodyColor),
        ),
      ),
    );
  }
}
