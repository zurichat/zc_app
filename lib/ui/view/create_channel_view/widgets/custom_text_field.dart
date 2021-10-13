import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyishColor, width: 0.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyishColor, width: 1),
        ),
      ),
    );
  }
}
