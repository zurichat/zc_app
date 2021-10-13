import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/general_widgets/menu_item_tile.dart';
import 'package:hng/models/plugin_model.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

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
            orgTitle: Text(Plugins, style: AppTextStyle.darkGreySize18Bold),
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
                          style: AppTextStyle.darkGreySize16,
                        ),
                        UIHelper.verticalSpaceMedium,
                        Text(
                          '''Access your oganization’s important stuff'''
                          ''' like holiday-calendar, meeting room, notice'''
                          ''' board etc. Have fun by joining the chess'''
                          ''' room and music room.''',
                          style: AppTextStyle.lightGreySize14,
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
                          text: Text("Add Plugin",
                              style: AppTextStyle.lightGreySize16),
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
                              style: AppTextStyle.lightGreySize16,
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
