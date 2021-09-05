import 'package:flutter/material.dart';

class CustomUserChannel extends StatelessWidget {
  const CustomUserChannel({Key? key, this.image, this.text, this.trailingIcon})
      : super(key: key);
  final image;
  final text;
  final trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 379,
        child: Row(
          children: [
            Container(
              child: Image(
                height: 34,
                width: 34,
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
            SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 20),
            Container(
              height: 7,
              width: 7,
              child: Icon(
                trailingIcon,
                size: 9,
              ),
            )
          ],
        )
    );
  }
}
