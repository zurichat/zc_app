import 'package:flutter/material.dart';

///This is the text field with border
///Should accept only hint with no labels
///To use labels see the [AndroidTextField]
///
///Auto focus is automatically set to true to override this
///change set auto focus to false
class BorderTextField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final String hint;
  final bool? autofocus;

  const BorderTextField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.hint,
    this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      autofocus: autofocus ?? true,
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.black45,
        ),
        contentPadding: EdgeInsets.fromLTRB(16, 5, 16, 5),
      ),
    );
  }
}
