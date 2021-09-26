import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

///This is the text field with border
///Should accept only hint with no labels
///To use labels see the [LabelTextField]
///
///Auto focus is automatically set to false to override this
///change set auto focus to true
///
///This is primarily used in searches
class BorderTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String hint;
  final bool autofocus;

  const BorderTextField({
    Key? key,
    this.onChanged,
    this.controller,
    required this.hint,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 16, color: Colors.black87),
      autofocus: autofocus,
      onChanged: onChanged,
      controller: controller,
      cursorColor: AppColors.zuriPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        border: border(),
        focusedBorder: border(),
        enabledBorder: border(),
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.black45,
        ),
        contentPadding: EdgeInsets.fromLTRB(16, 5, 16, 5),
      ),
    );
  }

  border({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300] ?? AppColors.greyColor,
      ),
      borderRadius: BorderRadius.circular(4),
    );
  }
}

///This is the text field with border a
///Should accept only labels
///To use hint see the [BorderTextField]
///
///Auto focus is automatically set to false to override this
///change set auto focus to true
///
///This is primarily used in the login screen
class LabelTextField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final String label;
  final bool autofocus;

  const LabelTextField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.label,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 14, color: Colors.black87),
      autofocus: autofocus,
      onChanged: onChanged,
      controller: controller,
      cursorColor: AppColors.zuriPrimaryColor,
      decoration: InputDecoration(
        labelText: label,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: Colors.black45,
        ),
        contentPadding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
      ),
    );
  }
}
