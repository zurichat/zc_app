import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:hng/ui/shared/shared.dart';
=======
import 'package:hng/ui/shared/colors.dart';
>>>>>>> 15ccbb9e3562e9d48f0a05afca86369ee9558cc5

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
    this.validator,
    this.autovalidateMode,
    this.onchanged,
  }) : super(key: key);
  final keyboardType;
  final inputAction;
  final controller;
  final validator;
  final autovalidateMode;
  final onchanged;

  final bool? autoCorrect;
  final bool? obscureText;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      autovalidateMode: autovalidateMode,
      validator: validator,
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
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(3.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: AppColors.zuriPrimaryColor,
          ),
        ),
      ),
    );
  }
}
