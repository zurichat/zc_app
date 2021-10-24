import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../shared/dumb_widgets/menu_item_tile.dart';
import 'preference_viewmodel.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    final bool _dark = Theme.of(context).brightness == Brightness.dark;
    TextStyle _menuTitleStyle =
        _dark ? AppTextStyle.whiteSize16 : AppTextStyle.darkGreySize16;
    return ViewModelBuilder<PreferenceViewModel>.reactive(
      viewModelBuilder: () => PreferenceViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          orgTitle: Text(
            local!.preferences,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
          leading: Icons.close_outlined,
          leadingPress: () => model.exitPage(),
          isDarkMode: _dark,
          whiteBackground: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UIHelper.verticalSpaceMedium,
              MenuItemTile(
                topBorder: false,
                text: Text(local.langAndRegion, style: _menuTitleStyle),
                onPressed: model.navigateLanguageAndRegion,
              ),
              SwitchListTile(
                value: model.isDarkMode,
                onChanged: model.changeTheme,
                title: Text(local.darkMode, style: _menuTitleStyle),
                selected: model.isDarkMode,
                subtitle: Text(model.currentTheme),
              ),
              //TODO
              // MenuItemTile(
              //   text: Text(local.advanced, style: _menuTitleStyle),
              //   onPressed: model.navigateToAdvanced,
              // ),

              // MenuItemTile(
              //   text: Text(local.sendFeedback, style: _menuTitleStyle),
              //   onPressed: model.sendFeedback,
              // ),
              // MenuItemTile(
              //   text: Text(local.helpCenter, style: _menuTitleStyle),
              //   onPressed: model.helpCentre,
              // ),
              // MenuItemTile(
              //   text: Text(local.privacyNLicenses, style: _menuTitleStyle),
              //   onPressed: model.privacyAndLicences,
              // ),

              UIHelper.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
