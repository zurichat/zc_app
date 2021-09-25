import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/colors.dart';

class CustomSearchField extends StatelessWidget {
  final String searchHint;

  CustomSearchField({
    Key? key,
    required this.searchHint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      hintText: searchHint,
      hintStyle: TextStyle(
          color: Color(0xFFA1A9B2),
          fontWeight: FontWeight.w400,
          fontSize: 14.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor, width: 0.5),
      ),
    ));
  }
}
