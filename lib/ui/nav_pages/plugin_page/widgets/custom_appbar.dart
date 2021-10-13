import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:zurichat/ui/shared/colors.dart';

class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;
  final String appbarAction;
  final double appBarHeight;
  final PluginViewModel model;

  CustomAppBars(
      {Key? key,
      required this.appbarTitle,
      required this.appbarAction,
      this.appBarHeight = 56,
      required this.model})
      : preferredSize = Size.fromHeight(appBarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            appbarTitle,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: AppColors.deepBlackColor),
          ),
          GestureDetector(
            onTap: () {
              switch (appbarAction) {
                case 'Edit':
                  model.navigateToEdit();
                  break;
                case 'Done':
                  model.navigateToPlugins();
                  break;
                case 'Add':
                  model.navigateToPlugins();
              }
            },
            child: Text(
              appbarAction,
              style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.zuriPrimaryColor),
            ),
          ),
        ],
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: SizedBox(
            height: 16.0,
            width: 16.0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 16.0),
              onPressed: () {
                if (appbarAction == 'Edit') {
                  model.navigateToHome();
                } else {
                  Navigator.of(context).pop();
                }
              },
            )),
      ),
      leadingWidth: 40,
      elevation: 1.0,
    );
  }
}
