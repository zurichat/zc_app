import 'package:flutter/material.dart';

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
  }) : super(key: key);
  final keyboardType;
  final inputAction;
  final controller;

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
