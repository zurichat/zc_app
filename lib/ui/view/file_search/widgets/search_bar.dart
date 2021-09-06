import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

// search bar
final Image closeIcon = Image.asset('assets/images/close_search.png');
final Image voiceSearch = Image.asset('assets/images/voice_search.png');

class CustomSearchBar extends StatelessWidget {
  final searchFilter;
  const CustomSearchBar({
    Key? key,
    this.searchFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.paleGreen, borderRadius: BorderRadius.circular(8)),
      child: ListTile(
          leading: Padding(padding: EdgeInsets.all(8), child: closeIcon),
          title: Padding(padding: EdgeInsets.all(8), child: Text(searchFilter, style: AppTextStyles.unreadText)),
          trailing: Padding(padding: EdgeInsets.all(8), child: voiceSearch)),
    );
  }
}