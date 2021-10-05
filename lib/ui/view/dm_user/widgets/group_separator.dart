import 'package:flutter/material.dart';

class GroupSeparator extends StatelessWidget {
  final String value = 'Today';

  const GroupSeparator(String value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          const Expanded(
              child: Divider(
            color: Color(0xFF7B8794),
          )),
          Container(
            child: Text(value,
                style: const TextStyle(
                    fontSize: 12.0, fontWeight: FontWeight.w400)),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF7B8794),
                width: 0.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          const Expanded(
              child: Divider(
            color: Color(0xFF7B8794),
          )),
        ],
      ),
    );
  }
}
