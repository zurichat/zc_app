import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

class SearchSubSection extends StatelessWidget {
  final String? subtitle, title;
  final IconData? leadingIcon, trailingIcon;
  final VoidCallback onTap;

  const SearchSubSection(
      {required this.leadingIcon,
      required this.onTap,
      required this.title,
      this.subtitle,
      required this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            leadingIcon,
            color: AppColors.greyColor,
          ),
          title: Text(
            title!,
            style: AppTextStyles.kSubSectionTextStyle,
          ),
          trailing: subtitle == null
              ? Icon(
                  trailingIcon,
                  color: AppColors.greyColor,
                )
              : Text(
                  subtitle!,
                  style: AppTextStyles.kSubSectionTextStyle,
                ),
        ),
      ),
    );
  }
}
