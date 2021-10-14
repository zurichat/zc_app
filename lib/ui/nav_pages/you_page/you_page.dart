import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/styles.dart';
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
        appBar: ZuriAppBar(
          orgTitle: Text(You, style: ZuriTextStyle.organizationNameText()),
          bottomNavBarScreen: true,
          leadingWidth: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => model.getUserStatus(),
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
                  text: Text(
                    PauseNotifs,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.pauseNotifications,
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  topBorder: false,
                  text: Text.rich(
                    TextSpan(
                      text: SetStatusText,
                      style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
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
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: Icons.bookmark_outline_outlined,
                  text: Text(
                    SavedItems,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewSavedItem,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: Icons.account_circle_outlined,
                  text: Text(
                    ViewProfile,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: () => model.getUserStatus(),
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: Icons.trip_origin,
                  text: Text(
                    Notifs,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewNotifications,
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: Icons.settings,
                  text: Text(
                    Preferences,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewPreferences,
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: Icons.logout_sharp,
                  text: Text(
                    SignOut,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.signOutAccount,
                  topBorder: false,
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
