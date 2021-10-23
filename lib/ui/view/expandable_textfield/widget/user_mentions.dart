import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/extensions/string_extension.dart';

class MyStatelessWidget extends StatelessWidget {
  final String membersList;
  final String name;
  const MyStatelessWidget(
      {Key? key, required this.membersList, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/chimamanda.png',
          ),
          const SizedBox(width: 16.0),
          Text(membersList.capitalize(),
              style: AppTextStyle.darkGreySize16Bold),
          const SizedBox(width: 16.0),
          Align(
              alignment: name == '-' ? Alignment.center : Alignment.centerLeft,
              child: Text(name, style: AppTextStyle.lightGreySize16))
        ],
      ),
    );
  }
}
