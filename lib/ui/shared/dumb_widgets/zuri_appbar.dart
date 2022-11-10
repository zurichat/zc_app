import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/colors.dart';

import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/shared.dart';

// ignore: must_be_immutable
class ZuriAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? leading;
  final IconData? searchBarIcon;
  final Widget? orgTitle;
  bool leadingWidth;
  bool onlineIndicator;
  final Function()? leadingPress;
  final Function(String)? onChanged;
  final TextEditingController? searchController;
  final String? title;
  final String? hintText;

  bool bottomNavBarScreen;
  bool whiteBackground;
  bool isDarkMode;
  final Function()? onEditingComplete;
  bool isSearchBar;
  final String? subtitle;
  final List<Widget>? actions;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Function()? onTap;

  ZuriAppBar({
    this.leading,
    this.title,
    this.leadingWidth = false,
    this.subtitle,
    this.actions,
    this.bottomNavBarScreen = false,
    this.whiteBackground = false,
    this.isDarkMode = false,
    this.onlineIndicator = false,
    Key? key,
    this.leadingPress,
    this.isSearchBar = false,
    this.searchController,
    this.searchBarIcon,
    this.hintText,
    this.onChanged,
    this.orgTitle,
    this.onEditingComplete,
    this.prefixIcon,
    this.focusNode,
    this.onTap,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(isSearchBar ? 70 : 60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 1,
      leadingWidth: leadingWidth ? 10 : null,
      leading: isSearchBar
          ? null
          : InkWell(
              onTap: leadingPress,
              child: Icon(leading,
                  color:
                      isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                  size: 16)),
      title: isSearchBar
          ? Container(
              margin: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
              height: 40.0,
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: onChanged,
                style: AppTextStyle.whiteSize16,
                onEditingComplete: onEditingComplete,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintStyle: AppTextStyle.whiteSize16,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide.none),
                  prefixIcon: searchBarIcon != null
                      ? IconButton(
                          icon:
                              Icon(searchBarIcon, color: AppColors.whiteColor),
                          onPressed: leadingPress,
                        )
                      : prefixIcon,
                  hintText: hintText,
                  filled: true,
                  fillColor: AppColors.appBarGreen,
                  contentPadding: const EdgeInsets.only(top: 4.0),
                ),
                toolbarOptions: const ToolbarOptions(
                    copy: true, paste: true, selectAll: true, cut: true),
                cursorColor: AppColors.whiteColor,
                focusNode: focusNode,
                onTap: onTap,
              ),
            )
          : subtitle == null
              //TODO - bug: condition doesn't accomodate supplying a string title (!widget) && null subtitle
              //sample on select_email_view.dart
              ? orgTitle
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title!,
                          style: AppTextStyle.darkGreySize16Bold.copyWith(
                            color: isDarkMode ? AppColors.whiteColor : null,
                          ),
                        ),
                        Text(
                          subtitle!,
                          style: AppTextStyle.lightGreySize14,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    onlineIndicator
                        ? Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                          )
                        : const SizedBox()
                  ],
                ),
      titleTextStyle: AppTextStyle.organizationNameText,
      centerTitle: false,
      backgroundColor: !whiteBackground
          ? isDarkMode
              ? AppColors.darkThemePrimaryColor
              : AppColors.zuriPrimaryColor
          : isDarkMode
              ? AppColors.darkThemePrimaryColor
              : AppColors.whiteColor,
      actions: isSearchBar ? null : actions,
    );
  }
}
