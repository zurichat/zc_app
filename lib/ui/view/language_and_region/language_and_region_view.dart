import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/menu_item_tile.dart';
import 'language_and_region_viewmodel.dart';

class LanguageAndRegionModelView extends StatelessWidget {
  const LanguageAndRegionModelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalization.of(context);
    return ViewModelBuilder<LanguageAndRegionModelViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          leading: Icons.close_rounded,
          whiteBackground: true,
          isDarkMode: Theme.of(context).brightness == Brightness.dark,
          leadingPress: () => model.goBack(),
          orgTitle: Text(
            local!.langAndRegion,
            style: AppTextStyle.darkGreySize20Bold.copyWith(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ),
        body: Column(
          children: [
            MenuItemTile(
              text: Text(local.language),
              subtitle: model.currentLanguage,
              onPressed: () => model.changeLanguage(context),
            ),
            // MenuItemTile.flipSwitch(
            //   text: Text(local.setTimezone),
            //   subtitle: model.currentTimeZone,
            //   value: model.automaticTimeZone,
            //   onChanged: model.toggleAutomaticTimeZone,
            // )
          ],
        ),
      ),
      viewModelBuilder: () => LanguageAndRegionModelViewModel(),
    );
  }
}
