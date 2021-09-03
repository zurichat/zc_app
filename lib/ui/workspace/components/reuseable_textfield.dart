import 'package:flutter/material.dart';

class ReuseableTextField extends StatelessWidget {
  ReuseableTextField(
      {required this.hintText,
        required this.controller,
        required this.keyboardType});

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Color(0xffBEBEBE), fontSize: 16, fontWeight: FontWeight.w700),
      ),
      cursorColor: Color(0xff00B87C),
      // validator: (String? value) {
      //   if (value!.isEmpty) {
      //     return 'Input is required';
      //   }
      // },
    );
  }
}
