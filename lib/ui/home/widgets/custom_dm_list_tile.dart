import 'package:flutter/material.dart';
import 'package:hng/ui/direct_message/direct_message.dart';

import '../../../utilities/constants/styles.dart';

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
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DirectMessage(username: userName))),
      child: Row(
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
      ),
    );
  }
}
