import 'package:flutter/material.dart';
import 'package:hng/ui/shared/styles.dart';

class SearchSection extends StatelessWidget {
  final String title;

  const SearchSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppTextStyles.kSectionTextStyle,
      ),
    );
  }
}
