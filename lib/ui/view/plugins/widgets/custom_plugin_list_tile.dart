import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomPluginPageListTile extends StatelessWidget {
  final leadingIcon;
  final String text;
  final Color textColor;
  final IconData trailingIcon;
  final bool isChecked;

  CustomPluginPageListTile(
      {Key? key,
      required this.leadingIcon,
      required this.text,
      required this.textColor,
      this.trailingIcon = Icons.clear,
      this.isChecked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leadingIcon,
        SizedBox(
          width: 16,
        ),
        Text(text,
            style: TextStyle(
                fontSize: 16.0, color: textColor, fontWeight: FontWeight.w400)),
        /*Visibility(
            visible: false,
            child: Icon(
              trailingIcon,
              size: 24.0,
              color: Color(0xFFF40101),
            )),
        Visibility(
            visible: false,
            child: Checkbox(
              checkColor: Colors.white,
              value: isChecked, onChanged: (bool? value) {  },
            ))*/
      ],
    );
  }
}
