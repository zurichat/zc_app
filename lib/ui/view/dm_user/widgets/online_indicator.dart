import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';

class OnlineIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      color: AppColors.zuriPrimaryColor,
      size: 10,
    );
  }
}


