import 'package:flutter/material.dart';

class CustomUserChannel extends StatelessWidget {
  const CustomUserChannel(
      {Key? key, this.image, this.text, this.text2, this.trailingIcon, this.iconColor})
      : super(key: key);
  final image;
  final text;
  final text2;
  final trailingIcon;
  final iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 24,
        width: 211,
        child: Row(
          children: [
            Container(
              child: Image(
                height: 24,
                width: 24,
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
            SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Text(
              text2,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            SizedBox(width: 10),
            Container(
              height: 8,
              width: 8,
              child: Icon(
                trailingIcon,
                size: 9,
                color: iconColor,
              ),
            )
          ],
        ));
  }
}
