import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final void Function()? onPressed;

  ProfileButton({
    this.onPressed,
    this.label,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 200),
      height: 50,

      child: TextButton.icon(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.only(right: 200)),
          // fixedSize: MaterialStateProperty.all(Size(500, 20))
        ),
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        label: Expanded(
            child: Text(
          "$label",
          style: TextStyle(color: Colors.black),
        )),
        onPressed: onPressed,
      ),
    );
  }
}