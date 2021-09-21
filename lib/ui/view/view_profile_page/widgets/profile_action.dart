import 'package:flutter/material.dart';

class ProfileAction extends StatelessWidget {
  final Function onTap;
  final Widget title;

  const ProfileAction({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        height: 45.0,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 4.0, bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: Colors.black54),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: title,
        ),
      ),
    );
  }
}
