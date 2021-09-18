
import 'package:flutter/material.dart';

Widget groupSeparator(String value) {
  return Container(
    margin: EdgeInsets.only(top: 16.0),
    child: Row(
      children: [
        Expanded(
            child: Divider(
              color: Color(0xFF7B8794),
            )),
        Container(
          child: Text(value,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400)),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF7B8794), width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        Expanded(
            child: Divider(
              color: Color(0xFF7B8794),
            )),
      ],
    ),
  );
}

