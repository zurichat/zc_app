import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import 'widgets/profile_page_head.dart';
import 'widgets/status_form.dart';
import 'you_page_viewmodel.dart';

// ignore: use_key_in_widget_constructors
class YouPage extends StatelessWidget {
  final storageService = locator<SharedPreferenceLocalStorage>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
        maxWidth: MediaQuery.of(context).size.width
      ),
      designSize: const Size(411, 823),
    );
    return ViewModelBuilder<YouPageViewModel>.reactive(
      onModelReady: (model) => model.futureToRun(),
      viewModelBuilder: () => YouPageViewModel(),
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
                    name: model.currentUserData.displayName.toString(),
                    currentStatus: model.currentStatus,
                    image: model.profileImage,
                  ),
                ),
                const SizedBox(height: 30),
                StatusForm(onPressed: model.setStatus),
                const SizedBox(height: 20),
                MenuItemTile(
                  icon: Icons.notifications_off_outlined,
                  text: const Text(PauseNotifs,style: TextStyle(fontSize:16,)),
                  onPressed: model.pauseNotifications,
                  topBorder: false,
                ),
                MenuItemTile(
                  text: Text.rich(
                    TextSpan(
                      text: SetStatusText,style: const TextStyle(fontSize:16,),
                      children: [
                        TextSpan(
                          text: model.otherStatus,
                          style: const TextStyle(fontWeight: FontWeight.bold,),
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
                  text: const Text(SavedItems, style: TextStyle(fontSize:16,),),
                  onPressed: model.viewSavedItem,
                ),
                MenuItemTile(
                  icon: Icons.account_circle_outlined,
                  text: const Text(ViewProfile,style: TextStyle(fontSize:16,)),
                  onPressed: model.viewProfile,
                  topBorder: false,
                ),
                MenuItemTile(
                  icon: Icons.trip_origin,
                  text: const Text(Notifs,style: TextStyle(fontSize:16,)),
                  onPressed: model.viewNotifications,
                  topBorder: false,
                ),
                MenuItemTile(
                  icon: Icons.settings,
                  text: const Text(Preferences,style: TextStyle(fontSize:16,)),
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
