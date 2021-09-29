import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ui/shared/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.controller,
      required this.keyboardType,
      required this.inputAction,
      required this.autoCorrect,
      required this.obscureText,
      this.labelText,
      this.hintText,
      this.onChanged,
      this.formatter,
      this.style,
      this.maxlines = 1,
      this.border,
      this.isDense,
      this.labelStyle= const TextStyle(color: Color(0xffA1A9B3)),
      this.isCollapsed = false,
      this.expands = false,
      this.textAlignVertical,
      this.onEditingComplete,
      this.prefixIcon,
      this.hintStyle = const TextStyle(
        fontWeight: FontWeight.w400,
        color: Color(0xFFA1A9B2),
      ),
      this.initialValue,
      this.helperText,
      this.helperMaxLines,
      this.contentPadding=const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      this.suffixIcon
  
      })
      : super(key: key);
  final keyboardType;
  final inputAction;
  final controller;
  //Function(String)? onChanged;
  final ValueChanged<String>?onChanged;
  final bool? autoCorrect;
  final bool? isDense;
  final dynamic maxlines;
  final InputBorder? border;
  final List<LengthLimitingTextInputFormatter>? formatter;
  final TextStyle? style;
  final bool? obscureText;
  final String? labelText;
  final String? hintText;
  final TextStyle? labelStyle;
  final bool isCollapsed;
  final bool expands;
  final TextAlignVertical? textAlignVertical;
  final VoidCallback ? onEditingComplete;
  final Widget? prefixIcon;
    final Widget? suffixIcon;
  final TextStyle? hintStyle;
 final  String? initialValue;
  final String? helperText;
  final int? helperMaxLines;
  final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: style,
      maxLines: maxlines,
      expands: expands,
    onChanged: onChanged,
      initialValue: initialValue,
      keyboardType: keyboardType,
      inputFormatters: formatter,
      textInputAction: inputAction,
      autocorrect: autoCorrect!,
      obscureText: obscureText!,
      
      textAlignVertical: textAlignVertical,
      cursorColor: AppColors.zuriPrimaryColor,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        isCollapsed: isCollapsed,
        isDense: isDense,
        contentPadding: contentPadding,
        labelText: labelText,
        labelStyle:labelStyle,
        
        // TextStyle(color: Color(0xffA1A9B3)),
        hintText: hintText,
        hintStyle: hintStyle,
        helperText: helperText,
        border: border,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(
            color: AppColors.zuriPrimaryColor,
          ),
        ),
      ),
    );
  }
}
         //  TextField(
                          //   decoration: InputDecoration(
                          //       isDense: true,
                          //       contentPadding: const EdgeInsets.all(8.8),
                          //       labelText: 'Search for channel...',
                          //       labelStyle:
                          //           const TextStyle(color: Color(0xffA1A9B3)),
                          //       border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(10))),
                          // ),