import 'package:flutter/material.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:hng/ui/nav_pages/you_page/widgets/status_form.dart';
import 'package:hng/ui/nav_pages/you_page/widgets/profile_page_head.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../../shared/shared.dart';

import 'you_page_viewmodel.dart';

class YouPage extends StatelessWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YouPageViewModel>.reactive(
      viewModelBuilder: () => YouPageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.zuriPrimaryColor,
          // Here we take the value from the
          // MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            "You",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.whiteColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: model.editProfile,
                  child: ProfilePageHead(
                    name: model.username,
                    currentStatus: model.currentStatus,
                    image: model.profileImage,
                  ),
                ),
                SizedBox(height: 30),
                StatusForm(onPressed: model.setStatus),
                SizedBox(height: 20),
                MenuItemTile(
                  icon: Icons.notifications_off_outlined,
                  text: Text("Pause Notifications"),
                  onPressed: model.pauseNotifications,
                  topBorder: false,
                ),
                MenuItemTile(
                  text: Text.rich(TextSpan(text: "Set Yourself as ", children: [
                    TextSpan(
                        text: model.otherStatus,
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ])),
                  icon: Icons.circle_outlined,
                  onPressed: model.toggleStatus,
                  topBorder: false,
                ),
                MenuItemTile(
                  icon: Icons.bookmark_outline_outlined,
                  text: Text("Saved Item"),
                  onPressed: model.viewSavedItem,
                ),
                MenuItemTile(
                  icon: Icons.account_circle_outlined,
                  text: Text("View Profile"),
                  onPressed: model.viewProfile,
                  topBorder: false,
                ),
                MenuItemTile(
                  icon: Icons.trip_origin,
                  text: Text("Notifications"),
                  onPressed: model.viewNotifications,
                  topBorder: false,
                ),
                MenuItemTile(
                  icon: Icons.settings,
                  text: Text("Preferences"),
                  onPressed: model.viewPreferences,
                  topBorder: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
