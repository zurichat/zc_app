import 'package:flutter/material.dart';

import 'package:hng/utilities/constants/styles.dart';

class CustomDMListTile extends StatelessWidget {
  final imagelink;
  final userName;
  const CustomDMListTile({
    Key? key,
    this.imagelink,
    this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagelink),
          radius: 20.0,
        ),
        const SizedBox(width: 8),
        Text(
          userName,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: greyishColor,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
