import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'widgets/profile_page_head.dart';
import 'widgets/status_form.dart';
import 'you_page_viewmodel.dart';

class YouPage extends StatelessWidget {
  const YouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
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
                  onTap: () => model.editProfile(),
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
                  icon: SvgPicture.asset(
                    'assets/icons/svg_icons/bell-off.svg',
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local!.pauseNotifications,
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
                      //TODO TRANSLATE
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
                  icon: SvgPicture.asset(
                    'assets/icons/svg_icons/circle.svg',
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  onPressed: model.toggleStatus,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    'assets/icons/svg_icons/bookmark.svg',
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.savedItems,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewSavedItem,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    'assets/icons/svg_icons/active.svg',
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.viewProfile,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewProfile,
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    'assets/icons/svg_icons/notification.svg',
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.notifications,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewNotifications,
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    'assets/icons/svg_icons/preference.svg',
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.preferences,
                    style: AppTextStyles.faintBodyText.copyWith(fontSize: 16),
                  ),
                  onPressed: model.viewPreferences,
                  topBorder: false,
                ),
                const SizedBox(height: 16),
                MenuItemTile(
                  icon: SvgPicture.asset(
                    'assets/icons/svg_icons/log-out.svg',
                    color: AppColors.darkGreyColor,
                    width: 18,
                    height: 18,
                  ),
                  text: Text(
                    local.signOut,
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
