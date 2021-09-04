import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.keyboardType,
    this.inputAction,
    this.autoFocus,
    this.autoCorrect,
    this.obscureText,
    this.labelText, this.hintText,
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
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)),),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)),borderSide: BorderSide(color: Color(0xff1A61DB
        ))),
      ),
    );
  }
}