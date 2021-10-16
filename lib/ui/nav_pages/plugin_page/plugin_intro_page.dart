import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:zurichat/ui/shared/long_button.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
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
            orgTitle: Text(
              local!.plugins,
              style: AppTextStyle.organizationNameText,
            ),
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
                    style: AppTextStyle.darkGreySize20Bold,
                  ),
                  UIHelper.verticalSpaceMedium,
                  Text(
                    local.pluginIntroBody,
                    style: AppTextStyle.darkGreySize14,
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
