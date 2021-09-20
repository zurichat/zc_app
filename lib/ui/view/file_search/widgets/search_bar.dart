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
    return Stack(
      children: [
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.paleGreen,
              borderRadius: BorderRadius.circular(8)),
          child: Positioned(
            top: 0,
            bottom: 0,
            child: ListTile(
                leading: closeIcon,
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'designers',
                    hintStyle: AppTextStyles.unreadText,
                  ),
                ),
                trailing: voiceSearch),
          ),
        ),
      ],
    );
  }
}
