import 'package:flutter/material.dart';

class CustomChannel extends StatelessWidget {
  final text;
  const CustomChannel({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 379,
      child: Row(
        children: [
          const Text('#',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
