import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

class PluginPageIntro extends StatelessWidget {
  const PluginPageIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? child) {
        return Scaffold(
          appBar: ZuriAppBar(
            orgTitle:
                Text(Plugins, style: ZuriTextStyle.organizationNameText()),
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
                        model.navigateToPlugins();
                      },
                      label: "Get Started",
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