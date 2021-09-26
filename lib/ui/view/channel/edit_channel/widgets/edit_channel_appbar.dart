import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import '../editChannelViewModel.dart';

class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
  final String appbarTitle;
  final String appbarAction;
  final double appBarHeight;
  final EditChannelViewModel model;

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
            style: AppTextStyles.header6,
          ),
          GestureDetector(
            onTap: () {
              switch (appbarAction) {
                case 'Save':
                  model.editChannel(context);
                  break;
                case 'Done':
                  //model.nToPlugins();
                  break;
                case 'Add':
                //model.nToPlugins();
              }
            },
            child: Container(
              width: 60.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0, 8.0),
                child: Text(
                  appbarAction,
                  textAlign: TextAlign.end,
                  style: AppTextStyles.body1Green,
                ),
              ),
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
              icon: Icon(Icons.arrow_back_ios, size: 16.0),
              onPressed: () {
                if (appbarAction == 'Edit') {
                  model.nToChannelInfo();
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