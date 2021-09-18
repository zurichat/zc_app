import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  final String title;
  final String description;

  const ProfileList({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            description,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
