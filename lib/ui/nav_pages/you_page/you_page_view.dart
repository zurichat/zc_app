import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import 'widgets/profile_page_head.dart';
import 'widgets/status_form.dart';
import 'you_page_viewmodel.dart';

class YouPage extends StatefulWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  State<YouPage> createState() => _YouPageState();
}

class _YouPageState extends State<YouPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<YouPageViewModel>.reactive(
      onModelReady: (model) => model.futureToRun(),
      viewModelBuilder: () => YouPageViewModel(),
      disposeViewModel: false,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.zuriPrimaryColor,
          // Here we take the value from the
          // MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text(
            You,
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
                    name: '${model.userModel?.lastName}',
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
