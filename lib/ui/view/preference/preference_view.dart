import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'preference_viewmodel.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreferenceViewModel>.reactive(
      viewModelBuilder: () => PreferenceViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
            orgTitle: Text('Preferences', style: AppTextStyles.heading4.copyWith(color: AppColors.blackColor)),
            leading: Icons.close_outlined,
            leadingPress: () => model.exitPage(),
            whiteBackground: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UIHelper.verticalSpaceMedium,
              MenuItemTile(
                topBorder: false,
                text: Text(
                  LangAndRegion,
                  style: AppTextStyles.faintBodyText.copyWith(
                    fontSize: 16,
                  ),
                ),
                onPressed: model.navigateLanguageAndRegion,
              ),
              MenuItemTile(
                text: Text(
                  DarkMode,
                  style: AppTextStyles.faintBodyText.copyWith(
                    fontSize: 16,
                  ),
                ),
                subtitle: model.currentTheme,
                onPressed: model.changeTheme,
              ),
              MenuItemTile(
                text: Text(
                  Advanced,
                  style: AppTextStyles.faintBodyText.copyWith(
                    fontSize: 16,
                  ),
                ),
                onPressed: model.navigateToAdvanced,
              ),
              MenuItemTile(
                text: Text(
                  SendFeedback,
                  style: AppTextStyles.faintBodyText.copyWith(
                    fontSize: 16,
                  ),
                ),
                onPressed: model.sendFeedback,
              ),
              MenuItemTile(
                text: Text(
                  HelpCenter,
                  style: AppTextStyles.faintBodyText.copyWith(
                    fontSize: 16,
                  ),
                ),
                onPressed: model.helpCentre,
              ),
              MenuItemTile(
                text: Text(
                  PrivacyNLicenses,
                  style: AppTextStyles.faintBodyText.copyWith(
                    fontSize: 16,
                  ),
                ),
                onPressed: model.privacyAndLicences,
              ),
              UIHelper.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}