import 'package:flutter/material.dart';

class StartMessage extends StatelessWidget {
  final String? userName;

  const StartMessage({
    Key? key,
    //TODO assign to app_strings.dart
    this.userName = 'OyinkanUA',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'This is the very beginning of your '
              'direct message history with ',
          style: const TextStyle(
            color: Color(0xFF808080),
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
                text: '$userName. ',
                style: const TextStyle(color: Color(0xFF8CDEC3))),
            const TextSpan(
              text: 'Only the two of you are in this conversation, '
                  'and no one else can join it.',
            )
          ]),
    );
  }
}
