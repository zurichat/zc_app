import 'package:flutter/material.dart';

import '../../../utilities/constants/styles.dart';

class CustomDMListTile extends StatelessWidget {
  final imagelink;
  final userName;
  final String name;
  const CustomDMListTile({
    Key? key,
    this.imagelink,
    this.name = 'assets/background/status.png',
    this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                  image: AssetImage(imagelink), fit: BoxFit.cover)),
        ),
        const SizedBox(width: 8),
        Text(
          userName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: greyishColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 14,
          height: 14,
          child: Image.asset(name),
        )
      ],
    );
  }
}
