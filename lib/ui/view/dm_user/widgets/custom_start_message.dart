import 'package:flutter/material.dart';

class StartMessage extends StatelessWidget {
  final userName;

  const StartMessage({
    Key? key,
    this.userName: 'OyinkanUA',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'This is the very beginning of your '
              'direct message history with ',
          style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 13.0,
              fontWeight: FontWeight.w400),
          children: [
            TextSpan(
                text: '$userName. ',
                style: TextStyle(color: Color(0xFF8CDEC3))),
            TextSpan(
                text: 'Only the two of you are in this conversation, '
                    'and no one else can join it.')
          ]),
    );
  }
}
