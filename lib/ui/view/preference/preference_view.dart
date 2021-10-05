import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'preference_viewmodel.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreferenceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text(Preferences),
          leading: IconButton(
            icon: const Icon(Icons.close_outlined),
            onPressed: model.exitPage,
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MenuItemTile(
                text: const Text(LangAndRegion),
                onPressed: model.navigateLanguageAndRegion,
              ),
              MenuItemTile(
                text: const Text(DarkMode),
                subtitle: model.currentTheme,
                onPressed: model.changeTheme,
              ),
              MenuItemTile(
                text: const Text(Advanced),
                onPressed: model.navigateToAdvanced,
              ),
              MenuItemTile(
                text: const Text(SendFeedback),
                onPressed: model.sendFeedback,
              ),
              MenuItemTile(
                text: const Text(HelpCenter),
                onPressed: model.helpCentre,
              ),
              MenuItemTile(
                text: const Text(PrivacyNLicenses),
                onPressed: model.privacyAndLicences,
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => PreferenceViewModel(),
    );
  }
}
