import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

class ShareMessageTextField extends StatelessWidget {
  TextEditingController controller;

  ShareMessageTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: '',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: InputBorder.none,
          hintText: 'Add a message',
          hintStyle: AppTextStyles.textButtonText.copyWith(
              decoration: TextDecoration.none, color: AppColors.greyColor)),
    );
  }
}
