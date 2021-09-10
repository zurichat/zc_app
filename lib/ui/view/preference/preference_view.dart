import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:hng/ui/view/preference/preference_viewmodel.dart';

import 'package:stacked/stacked.dart';

class PreferenceView extends StatelessWidget {
  const PreferenceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PreferenceViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Preferences'),
          leading: IconButton(
            icon: Icon(Icons.close_outlined),
            onPressed: model.exitPage,
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            MenuItemTile(
              text: Text("Language & Region"),
              onPressed: model.navigateLanguageAndRegion,
            ),
            MenuItemTile(
              text: Text("Dark mode"),
              subtitle: model.currentTheme,
              onPressed: model.changeTheme,
            ),
            MenuItemTile(
              text: Text("Advanced"),
              onPressed: model.navigateToAdvanced,
            ),
            MenuItemTile(
              text: Text("Send Feedback"),
              onPressed: model.sendFeedback,
            ),
            MenuItemTile(
              text: Text("Help Center"),
              onPressed: model.helpCentre,
            ),
            MenuItemTile(
              text: Text("Privacy & licences"),
              onPressed: model.privacyAndLicences,
            ),
          ],
        ),
      ),
      viewModelBuilder: () => PreferenceViewModel(),
    );
  }
}
