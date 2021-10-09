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
          orgTitle: Text(Preferences, style: AppTextStyles.heading7),
          leading: Icons.close_outlined,
          leadingPress: () => model.exitPage(),
        ),
        body: SingleChildScrollView(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            margin: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                UIHelper.verticalSpaceMedium,
                MenuItemTile(
                  text: Text(
                    LangAndRegion,
                    style: AppTextStyles.faintBodyText.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: model.navigateLanguageAndRegion,
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
                MenuItemTile(
                  text: Text(Advanced,
                      style: AppTextStyles.faintBodyText.copyWith(
                        fontSize: 16,
                      )),
                  onPressed: model.navigateToAdvanced,
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
                MenuItemTile(
                  text: Text(
                    SendFeedback,
                    style: AppTextStyles.faintBodyText.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: model.sendFeedback,
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
                MenuItemTile(
                  text: Text(
                    HelpCenter,
                    style: AppTextStyles.faintBodyText.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  onPressed: model.helpCentre,
                ),
                const SizedBox(height: 16),
                const Divider(color: AppColors.dividerColor),
                const SizedBox(height: 16),
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
      ),
    );
  }
}
