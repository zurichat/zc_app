import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/shared/styles.dart';
import 'package:zurichat/ui/shared/text_styles.dart';

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
  final Color? leadingColor;
  bool bottomNavBarScreen;
  bool whiteBackground;
  final Function()? onEditingComplete;
  bool isSearchBar;
  final String? subtitle;
  final List<Widget>? actions;

  ZuriAppBar({
    this.leading,
    this.title,
    this.leadingWidth = false,
    this.subtitle,
    this.leadingColor,
    this.actions,
    this.bottomNavBarScreen = false,
    this.whiteBackground = false,
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
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 2,
      leadingWidth: leadingWidth ? 10 : null,
      leading: InkWell(
          child: Icon(
            leading,
            color: leadingColor,
          ),
          onTap: leadingPress),
      title: isSearchBar
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                autofocus: false,
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: onChanged,
                style: AppTextStyles.buttonText,
                maxLines: 1,
                onEditingComplete: onEditingComplete,
                decoration: InputDecoration(
                    hintStyle: AppTextStyles.buttonText
                        .copyWith(color: Colors.white60),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none),
                    prefixIcon: IconButton(
                      icon: Icon(searchBarIcon, color: AppColors.whiteColor),
                      onPressed: leadingPress,
                    ),
                    hintText: hintText,
                    filled: true,
                    fillColor: AppColors.appBarGreen),
                toolbarOptions: const ToolbarOptions(
                    copy: true, paste: true, selectAll: true, cut: true),
              ),
            )
          : subtitle == null
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
                        Text(title!, style: AppTextStyles.heading7),
                        Text(
                          subtitle!,
                          style: AppTextStyles.messageText
                              .copyWith(color: AppColors.greyColor),
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
      titleTextStyle: ZuriTextStyle.organizationNameText(),
      centerTitle: false,
      actions: actions,
      backgroundColor:
          !whiteBackground ? AppColors.zuriPrimaryColor : AppColors.whiteColor,
    );
  }
}
