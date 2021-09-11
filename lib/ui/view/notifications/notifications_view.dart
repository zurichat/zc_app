import 'package:flutter/material.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:stacked/stacked.dart';

import 'notifications_viewmodel.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuItemTile(
                text: Text("On mobile, notify me about..."),
                subtitle: "Direct messages, mentions & keywords",
              ),
              MenuItemTile(
                text: Text("Notify me on mobile..."),
                subtitle: "As soon as I'm active",
              ),
              MenuItemTile(
                text: Text("Sound"),
                subtitle: "Ding",
              ),
              MenuItemTile.flipSwitch(
                text: Text("Vibrate"),
                value: model.vibrate,
                onChanged: model.toggleVibrate,
              ),
              MenuItemTile.flipSwitch(
                text: Text("Light"),
                value: model.light,
                onChanged: model.toggleLight,
              ),
              MenuItemTile(
                text: Text("Troubleshoot notifications"),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "General Settings",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              MenuItemTile(
                text: Text("Notification Schedule"),
                subtitle: "Everyday",
                topBorder: false,
              ),
              MenuItemTile.flipSwitch(
                text: Text("In-app notification"),
                subtitle: "In-app notifications appear while the app is open",
                value: model.inAppNotification,
                onChanged: model.toggleInAppNotification,
              ),
              MenuItemTile.flipSwitch(
                text: Text("My Keyword"),
                subtitle: "Get notified when people say...",
                value: model.notifyOnKeyword,
                onChanged: model.toggleNotifyOnKeyword,
              ),
              MenuItemTile(
                text: Text("Channel-specific notifications (0)"),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => NotificationsViewModel(),
    );
  }
}
