import 'package:flutter/material.dart';

class CustomChannel extends StatelessWidget {
  final text;
  const CustomChannel({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 211,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5,0,0,0),
        child: Row(
          children: [
            const Text('#',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            const SizedBox(width: 21.33),
            Text(
              text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
