import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';
import 'textstyles.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 1.0, color: AppColors.borderColor)),
      margin: const EdgeInsets.only(right: 8, left: 8, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding (
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24),
            child: Text(
              '#teamsocrates',
              style: headerStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
            ),
            child: Text(
              'Description',
              style: nameStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 10,
            ),
            child: Text(
              'No description set',
              style: descriptionStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 6,
            ),
            child: Text(
              'Mark created this channel on August 13.',
              style: faintTextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 17,
              vertical: 18,
            ),
            child: Text(
              'Topic',
              style: nameStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 19, bottom: 19, top: 10),
            child: Text(
              'Creating the zuri main app',
              style: descriptionStyle(),
            ),
          ),
        Divider(
          thickness: 1,
        ),
          SizedBox(height: 10),
          Center(
            child: TextButton(
              onPressed: (){},
              child: Text('Edit',
              style: greenTextStyle())
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
