import 'package:flutter/material.dart';
import 'package:zurichat/general_widgets/menu_item_tile.dart';

import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import 'notifications_viewmodel.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<NotificationsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          leadingPress: () => model.goBack(),
          orgTitle: Text(
            local!.notifications,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          whiteBackground: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuItemTile(
                text: Text(local.notifyAbout),
                subtitle: local.notifyAboutSubtitle,
              ),
              MenuItemTile(
                text: Text(local.notifyOnMobile),
                subtitle: local.notifyOnMobileSubtitle,
              ),
              MenuItemTile(
                text: Text(local.sound),
                subtitle: local.ding,
              ),
              MenuItemTile.flipSwitch(
                text: Text(local.vibrate),
                value: model.vibrate,
                onChanged: model.toggleVibrate,
              ),
              MenuItemTile.flipSwitch(
                text: Text(local.light),
                value: model.light,
                onChanged: model.toggleLight,
              ),
              MenuItemTile(
                text: Text(local.troubleShootNotifs),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  local.generalSettings,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              MenuItemTile(
                text: Text(local.notificationSchedule),
                subtitle: local.everyday,
                topBorder: false,
              ),
              MenuItemTile.flipSwitch(
                text: Text(local.inAppNotify),
                subtitle: local.inAppNotifySubtitle,
                value: model.inAppNotification,
                onChanged: model.toggleInAppNotification,
              ),
              MenuItemTile.flipSwitch(
                text: Text(local.myKeyword),
                subtitle: local.myKeywordSubtitle,
                value: model.notifyOnKeyword,
                onChanged: model.toggleNotifyOnKeyword,
              ),
              MenuItemTile(
                text: Text(local.channelSpecificNotify),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => NotificationsViewModel(),
    );
  }
}
