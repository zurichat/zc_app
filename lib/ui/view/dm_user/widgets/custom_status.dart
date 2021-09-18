
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/styles.dart';

class CustomStatus extends StatelessWidget {
  final bool isActive;
  final String? data;

  const CustomStatus({
    Key? key,
    this.data,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isActive ? AppTextStyles.statusIcon(int.parse(data!)) : Container();
  }
}

