import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'preference_viewmodel.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreferenceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
            orgTitle: Text(
              'Preferences',
              style: AppTextStyle.darkGreySize18Bold,
            ),
            leading: Icons.close_outlined,
            leadingPress: () => model.exitPage(),
            whiteBackground: true),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ]),
            child: Column(
              children: [
                MenuItemTile(
                  text: Text(
                    'Language & Region',
                    style: AppTextStyle.darkGreySize16,
                  ),
                  onPressed: model.navigateLanguageAndRegion,
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
                MenuItemTile(
                  text: Text(
                    'Dark mode',
                    style: AppTextStyle.darkGreySize16,
                  ),
                  subtitle: model.currentTheme,
                  onPressed: model.changeTheme,
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
                MenuItemTile(
                  text: Text(
                    'Advanced',
                    style: AppTextStyle.darkGreySize16,
                  ),
                  onPressed: model.navigateToAdvanced,
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
                MenuItemTile(
                  text: Text(
                    'Send Feedback',
                    style: AppTextStyle.darkGreySize16,
                  ),
                  onPressed: model.sendFeedback,
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
                MenuItemTile(
                  text: Text(
                    'Help Center',
                    style: AppTextStyle.darkGreySize16,
                  ),
                  onPressed: model.helpCentre,
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
                MenuItemTile(
                  text: Text(
                    'Privacy & licences',
                    style: AppTextStyle.darkGreySize16,
                  ),
                  onPressed: model.privacyAndLicences,
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => PreferenceViewModel(),
    );
  }
}
