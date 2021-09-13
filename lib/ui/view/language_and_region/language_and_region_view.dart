import 'package:flutter/material.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:stacked/stacked.dart';

import 'language_and_region_viewmodel.dart';

class LanguageAndRegionModelView extends StatelessWidget {
  const LanguageAndRegionModelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguageAndRegionModelViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Languages & Region"),
          elevation: 0,
        ),
        body: Column(
          children: [
            MenuItemTile(
              text: Text("Language"),
              subtitle: model.currentLanguage,
              onPressed: model.changeLanguage,
            ),
            MenuItemTile.flipSwitch(
              text: Text("Set time zone automatically"),
              subtitle: model.currentTimeZone,
              value: model.automaticTimeZone,
              onChanged: model.toggleAutomaticTimeZone,
            )
          ],
        ),
      ),
      viewModelBuilder: () => LanguageAndRegionModelViewModel(),
    );
  }
}
