import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'language_and_region_viewmodel.dart';

class LanguageAndRegionModelView extends StatelessWidget {
  const LanguageAndRegionModelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguageAndRegionModelViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          whiteBackground: true,
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          leadingPress: () => model.goBack(),
          orgTitle: Text(
            LangAndRegion,
            style: AppTextStyle.darkGreySize20Bold.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ),
        body: Column(
          children: [
            MenuItemTile(
              text: const Text(Language),
              subtitle: model.currentLanguage,
              onPressed: model.changeLanguage,
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
