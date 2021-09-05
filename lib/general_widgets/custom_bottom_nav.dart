import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

// ignore: use_key_in_widget_constructors
class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.whiteColor,
      selectedItemColor: AppColors.greenColor,
      unselectedItemColor: AppColors.navBarItemColor,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.house),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.comment),
          label: 'DMs',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.table_chart_outlined),
          label: 'Lounge',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'You',
        ),
      ],
    );
  }
}
