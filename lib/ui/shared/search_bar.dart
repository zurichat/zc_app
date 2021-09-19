import 'package:flutter/material.dart';
import 'package:hng/general_widgets/easy_container.dart';
import 'package:hng/ui/shared/text_styles.dart';

Widget searchBar({double vertical = 0.0, double horizontal = 0.0}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: EasyContainer(
      height: 50,
      width: double.infinity,
      radius: 7,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      alignment: Alignment.centerLeft,
      borderWidth: 1.5,
      borderColor: Colors.grey[300],
      child: Text(
        'Jump to...',
        style: ZuriTextStyle.mediumNormal(),
      ),
    ),
  );
}
