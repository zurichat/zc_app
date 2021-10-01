import 'package:flutter/material.dart';
class Startdm extends StatelessWidget{
  final String _dm;
  const Startdm(this._dm, {Key? key}) : super(key: key);

  get username => null;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'This is the very beginning of your '
              'direct message \nhistory with ',
          style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 14.0,
              fontWeight: FontWeight.w400),
          children: [
            TextSpan(
                text: '@$username. ',
                style: TextStyle(color: const Color(0xFF8CDEC3))),
            TextSpan(
                text: 'Only the two of you are in \nthis conversation, '
                    'and no one else can join it.')
          ]),
    );
  }
}