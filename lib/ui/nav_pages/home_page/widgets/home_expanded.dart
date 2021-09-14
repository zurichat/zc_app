import 'package:flutter/material.dart';

///Expanded List allows list to be expanded and contracted
///if expand is specified as false then the expanded list
///would be fixed with all the children displayed
///
///For example unread has fixed expanded items
class ExpandedList extends StatelessWidget {
  final bool expand;
  final String title;

  const ExpandedList({
    Key? key,
    this.expand = true,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return expansionTile();
  }

  Widget expansionTile() {
    return ExpansionTile(
      title: Container(),
      
    );
  }
}
