import 'package:flutter/material.dart';


class ReuseableTextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Color(0xffBEBEBE))),
        onPressed:  null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Next',
            style: TextStyle(
                color: Color(0xff424242), fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
        ));
  }
}
