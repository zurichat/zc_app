import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/general_widgets/menu_item_tile.dart';
import 'package:zurichat/models/plugin_model.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/long_button.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

class PluginPage extends StatelessWidget {
  const PluginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? child) {
        final local = AppLocalization.of(context);
        return Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.arrow_back_ios,
            leadingPress: model.navigateBack,
            isDarkMode: Theme.of(context).brightness == Brightness.dark,
            whiteBackground: true,
            orgTitle: Text(
              Plugins,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
              ),
            ),
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
                          local!.pluginIntroHeader,
                          style: AppTextStyle.darkGreySize16,
                        ),
                        UIHelper.verticalSpaceMedium,
                        Text(
                          local.pluginIntroBody,
                          style: AppTextStyle.lightGreySize14,
                        ),
                        UIHelper.customVerticalSpace(56.0),
                        FractionallySizedBox(
                          widthFactor: 0.5,
                          child: LongButton(
                            onPressed: () {
                              model.navigateToAdd();
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
                        MenuItemTile(
                          icon: SvgPicture.asset(
                            'assets/icons/svg_icons/plus.svg',
                            color: AppColors.zuriPrimaryColor,
                            width: 18,
                            height: 18,
                          ),
                          topBorder: false,
                          text: Text(local!.addPlugin,
                              style: AppTextStyle.lightGreySize16),
                        ),
                        for (PluginModel plugin in model.plugins)
                          MenuItemTile(
                            onPressed: () => model.navigateToWebviewPage(
                                plugin.name, plugin.url),
                            ico: plugin.icon,
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
