import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/channel_members.dart';
import 'package:hng/ui/shared/text_styles.dart';

class MyStatelessWidget extends StatelessWidget {
  final ChannelMembermodel membersList;
  const MyStatelessWidget({Key? key, required this.membersList})
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
<<<<<<< HEAD
          Text(
            membersList.name,
            style: AppTextStyles.body1Bold,
        ],
      ),
    );
}
