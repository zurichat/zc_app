import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/long_button.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';

class PluginPage extends StatelessWidget {
  const PluginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.zuriPrimaryColor,
            title: Text(
              Plugins,
              style: AppTextStyles.heading3,
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 272.0, horizontal: 116.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
          ),
        );
      },
    ); //
  }
}
