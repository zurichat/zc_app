import 'package:flutter/material.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

class PluginPageIntro extends StatelessWidget {
  const PluginPageIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? child) {
        final local = AppLocalization.of(context);
        return Scaffold(
          appBar: ZuriAppBar(
            isDarkMode: Theme.of(context).brightness == Brightness.dark,
            orgTitle: Text(local!.plugins,
                style: ZuriTextStyle.organizationNameText()),
            bottomNavBarScreen: true,
            leadingWidth: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    local.pluginIntroHeader,
                    style: AppTextStyles.header6,
                  ),
                  UIHelper.verticalSpaceMedium,
                  Text(
                    local.pluginIntroBody,
                    style: AppTextStyles.body1Grey,
                  ),
                  UIHelper.customVerticalSpace(56.0),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: LongButton(
                      onPressed: () {
                        model.navigateToPlugins();
                      },
                      label: local.getstarted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
