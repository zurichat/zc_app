import 'package:flutter/material.dart';

import 'textfield_style.dart';

Widget appBarMain() {
  return AppBar(
    actions: [
      GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 19),
          child: Text(
            'Done',
            style: greenTextStyle(),
          ),
        ),
      )
    ],
    backgroundColor: Colors.white,
    title: Text(
      '#teamsocrates',
      style: headerStyle(),
    ),
  );
}
