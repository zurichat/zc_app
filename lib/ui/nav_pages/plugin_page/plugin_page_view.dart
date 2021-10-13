import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/general_widgets/menu_item_tile.dart';
import 'package:zurichat/models/plugin_model.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/long_button.dart';
import 'package:zurichat/ui/shared/styles.dart';
import 'package:zurichat/ui/shared/ui_helpers.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import 'plugin_viewmodel.dart';

class PluginPage extends StatelessWidget {
  const PluginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? child) {
        return Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.arrow_back_ios,
            leadingPress: model.navigateBack,
            whiteBackground: true,
            orgTitle: Text(Plugins, style: AppTextStyles.heading4),
          ),
          body: !model.hasplugins
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get serious and have fun here",
                          style: AppTextStyles.header6,
                        ),
                        UIHelper.verticalSpaceMedium,
                        Text(
                          '''Access your oganization’s important stuff'''
                          ''' like holiday-calendar, meeting room, notice'''
                          ''' board etc. Have fun by joining the chess'''
                          ''' room and music room.''',
                          style: AppTextStyles.body1Grey,
                        ),
                        UIHelper.customVerticalSpace(56.0),
                        FractionallySizedBox(
                          widthFactor: 0.5,
                          child: LongButton(
                            onPressed: () {
                              model.navigateToAdd();
                            },
                            label: "Get Started",
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
                        MenuItemTile(
                          icon: Icons.add,
                          topBorder: false,
                          text: Text(
                            "Add Plugin",
                            style: AppTextStyles.faintBodyText.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        for (PluginModel plugin in model.plugins)
                          MenuItemTile(
                            onPressed: () => model.navigateToWebviewPage(
                                plugin.name, plugin.url),
                            icon: plugin.icon,
                            iconColor: AppColors.zuriPrimaryColor,
                            topBorder: false,
                            text: Text(
                              plugin.name,
                              style: AppTextStyles.faintBodyText.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
        );
      },
    ); //
  }
}
