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
          title: const Text('Notification'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MenuItemTile(
                text: Text('On mobile, notify me about...'),
                subtitle: 'Direct messages, mentions & keywords',
              ),
              const MenuItemTile(
                text: Text('Notify me on mobile...'),
                subtitle: "As soon as I'm active",
              ),
              const MenuItemTile(
                text: Text('Sound'),
                subtitle: 'Ding',
              ),
              MenuItemTile.flipSwitch(
                text: const Text('Vibrate'),
                value: model.vibrate,
                onChanged: model.toggleVibrate,
              ),
              MenuItemTile.flipSwitch(
                text: const Text('Light'),
                value: model.light,
                onChanged: model.toggleLight,
              ),
              const MenuItemTile(
                text: Text('Troubleshoot notifications'),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'General Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const MenuItemTile(
                text: Text('Notification Schedule'),
                subtitle: 'Everyday',
                topBorder: false,
              ),
              MenuItemTile.flipSwitch(
                text: const Text('In-app notification'),
                subtitle: 'In-app notifications appear while the app is open',
                value: model.inAppNotification,
                onChanged: model.toggleInAppNotification,
              ),
              MenuItemTile.flipSwitch(
                text: const Text('My Keyword'),
                subtitle: 'Get notified when people say...',
                value: model.notifyOnKeyword,
                onChanged: model.toggleNotifyOnKeyword,
              ),
              const MenuItemTile(
                text: Text('Channel-specific notifications (0)'),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => NotificationsViewModel(),
    );
  }
}
