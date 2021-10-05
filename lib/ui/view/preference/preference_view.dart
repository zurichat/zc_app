import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      builder: (context, model, child) => Scaffold(
        appBar: ZuriTopBar(
          orgTitle: Text('Preferences', style: AppTextStyles.heading7),
          leading:
            Icons.close_outlined,
            leadingPress: () => model.exitPage(),
            whiteBackground: true
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MenuItemTile(
                text: const Text('Language & Region'),
                onPressed: model.navigateLanguageAndRegion,
              ),
              MenuItemTile(
                text: const Text('Dark mode'),
                subtitle: model.currentTheme,
                onPressed: model.changeTheme,
              ),
              MenuItemTile(
                text: const Text('Advanced'),
                onPressed: model.navigateToAdvanced,
              ),
              MenuItemTile(
                text: const Text('Send Feedback'),
                onPressed: model.sendFeedback,
              ),
              MenuItemTile(
                text: const Text('Help Center'),
                onPressed: model.helpCentre,
              ),
              MenuItemTile(
                text: const Text('Privacy & licences'),
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
