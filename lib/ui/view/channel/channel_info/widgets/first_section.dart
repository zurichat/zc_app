import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';
import 'textstyles.dart';

class FirstSection extends StatelessWidget {
final String? channelName;
  FirstSection({this.channelName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      margin: const EdgeInsets.only(right: 5, left: 5, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 19, vertical: 30),
            child: Text(
              "$channelName",
              style: headerStyle(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 19,
            ),
            child: Text(
              'Description',
              style: nameStyle(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 15,
            ),
            child: Text(
              'No description set',
              style: descriptionStyle(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 19,
            ),
            child: Text(
              'Mark created this channel on August 13.',
              style: faintTextStyle(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 19,
              vertical: 15,
            ),
            child: Text(
              'Topic',
              style: descriptionStyle(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 19, right: 19, bottom: 19),
            child: Text(
              'Creating the zuri main app',
              style: descriptionStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
