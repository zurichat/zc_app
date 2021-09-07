import 'package:flutter/material.dart';

import '../../../shared/shared.dart';

// tab bar
class CustomTabBar extends StatelessWidget {
  final tab1;
  final tab2;
  const CustomTabBar({
    Key? key,
    this.tab1,
    this.tab2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          indicatorColor: AppColors.greenColor,
          tabs: [
            Tab(child: Text(tab1, style:AppTextStyles.unselectedLabelText)),
            Tab(child: Text(tab2, style:AppTextStyles.unselectedLabelText)),
          ],
        ),
      ),
    );
  }
}