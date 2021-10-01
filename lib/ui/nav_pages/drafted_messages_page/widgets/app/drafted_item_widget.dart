import 'package:flutter/material.dart';

class DraftedItemWidget extends StatelessWidget {
  const DraftedItemWidget({
    this.username,
    this.message,
    this.time,
    Key? key,
  }) : super(key: key);
  final String? username, message, time;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "$username",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    "$time",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "$message",
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1.0,
          //height: 3.0,
        ),
      ],
    );
  }
}
