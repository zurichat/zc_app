import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

class TextBox extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  TextBox({
    Key? key,
    required this.hint,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      child: TextField(
        //maxLines: 9,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.zuriDarkGrey),
          contentPadding: EdgeInsets.fromLTRB(25.0, 16.0, 25.0, 16.0),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}