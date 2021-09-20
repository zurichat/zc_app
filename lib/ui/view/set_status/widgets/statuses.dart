import 'package:flutter/material.dart';

class Statuses extends StatelessWidget {
  const Statuses({Key? key, required this.title, required this.children})
      : super(key: key);
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    List<Widget> columnChildren = [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Text("$title"),
      ),
      Divider(),
    ];
    columnChildren += children;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnChildren,
    );
  }
}
