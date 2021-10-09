import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'language_and_region_viewmodel.dart';

class LanguageAndRegionModelView extends StatelessWidget {
  const LanguageAndRegionModelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguageAndRegionModelViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text(LangAndRegion),
          elevation: 0,
        ),
        body: Column(
          children: [
            MenuItemTile(
              text: const Text(Language),
              subtitle: model.currentLanguage,
              onPressed: model.changeLanguage,
              // onChanged: model.setLanguage(Value),
            ),
            MenuItemTile.flipSwitch(
              text: const Text(SetTimezone),
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
