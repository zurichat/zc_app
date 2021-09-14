import 'package:flutter/material.dart';
import 'package:hng/utilities/validators.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    required this.keyboardType,
    required this.inputAction,
    required this.autoCorrect,
    required this.obscureText,
    required this.labelText,
    this.hintText,
    this.validator,
    this.autovalidateMode,
  }) : super(key: key);
  final keyboardType;
  final inputAction;
  final controller;
  final validator;
  final autovalidateMode;

  final bool? autoCorrect;
  final bool? obscureText;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: inputAction,
      // autofocus: ,
      autocorrect: autoCorrect!,
      obscureText: obscureText!,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: Color(0xff1A61DB),
          ),
        ),
      ),
    );
  }
}
