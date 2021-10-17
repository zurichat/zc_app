import 'package:flutter/material.dart';
import 'package:zurichat/general_widgets/menu_item_tile.dart';
import 'package:zurichat/models/plugin_model.dart';
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
        final bool _dark = Theme.of(context).brightness == Brightness.dark;

        return Scaffold(
          appBar: ZuriAppBar(
            isDarkMode: _dark,
            orgTitle: Text(
              local!.plugins,
              style: AppTextStyle.organizationNameText,
            ),
            bottomNavBarScreen: true,
            leadingWidth: true,
          ),
          body: !model.hasplugins
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          local.pluginIntroHeader,
                          style: _dark
                              ? AppTextStyle.whiteSize20Bold
                              : AppTextStyle.darkGreySize20Bold,
                        ),
                        UIHelper.verticalSpaceMedium,
                        Text(
                          local.pluginIntroBody,
                          style: _dark
                              ? AppTextStyle.whiteSize14
                              : AppTextStyle.darkGreySize14,
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
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //TODO
                        // MenuItemTile(
                        //   icon: Icons.add,
                        //   topBorder: false,
                        //   text: Text(
                        //     "Add Plugin",
                        //     style: AppTextStyles.faintBodyText.copyWith(
                        //       fontSize: 16,
                        //     ),
                        //   ),
                        // ),
                        for (PluginModel plugin in model.plugins)
                          MenuItemTile(
                            onPressed: () => model.navigateToWebviewPage(
                                plugin.name, plugin.url),
                            icon: Icon(plugin.icon),
                            iconColor: AppColors.zuriPrimaryColor,
                            topBorder: false,
                            text: Text(
                              plugin.name,
                              style: _dark
                                  ? AppTextStyle.whiteSize14
                                  : AppTextStyle.darkGreySize14,
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
