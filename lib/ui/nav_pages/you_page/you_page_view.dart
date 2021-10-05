import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'widgets/profile_page_head.dart';
import 'widgets/status_form.dart';
import 'you_page_viewmodel.dart';

class YouPage extends StatelessWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YouPageViewModel>.reactive(
      viewModelBuilder: () => YouPageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriTopBar(
          orgTitle: Text(You, style: ZuriTextStyle.organizationNameText()),
          bottomNavBarScreen: true,
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
                const SizedBox(height: 30),
                StatusForm(onPressed: model.setStatus),
                const SizedBox(height: 20),
                MenuItemTile(
                  icon: Icons.notifications_off_outlined,
                  text: const Text(PauseNotifs),
                  onPressed: model.pauseNotifications,
                  topBorder: false,
                ),
                MenuItemTile(
                  text: Text.rich(
                    TextSpan(
                      text: SetStatusText,
                      children: [
                        TextSpan(
                          text: model.otherStatus,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  icon: Icons.circle_outlined,
                  onPressed: model.toggleStatus,
                  topBorder: false,
                ),
                MenuItemTile(
                  icon: Icons.bookmark_outline_outlined,
                  text: const Text(SavedItems),
                  onPressed: model.viewSavedItem,
                ),
                MenuItemTile(
                  icon: Icons.account_circle_outlined,
                  text: const Text(ViewProfile),
                  onPressed: model.viewProfile,
                  topBorder: false,
                ),
                MenuItemTile(
                  icon: Icons.trip_origin,
                  text: const Text(Notifs),
                  onPressed: model.viewNotifications,
                  topBorder: false,
                ),
                MenuItemTile(
                  icon: Icons.settings,
                  text: const Text(Preferences),
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
