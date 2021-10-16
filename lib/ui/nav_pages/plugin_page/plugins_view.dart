import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/constants/app_strings.dart';

import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:hng/ui/nav_pages/plugin_page/widgets/custom_plugin_list_tile.dart';
import 'package:hng/ui/nav_pages/plugin_page/widgets/custom_search_field.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';

class PluginView extends StatelessWidget {
  const PluginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? child) {
        return Scaffold(
          appBar: ZuriAppBar(

            isDarkMode: Theme.of(context).brightness == Brightness.dark,
            orgTitle: Text(
              Plugins,
              style: AppTextStyle.darkGreySize20Bold,
            ),
            whiteBackground: true,
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
            child: Column(
              children: [
                const SizedBox(
                    height: 40.0,
                    child: CustomSearchField(
                      searchHint: 'Search plugin',
                    )),
                const SizedBox(
                  height: 25.0,
                ),
                GestureDetector(
                  onTap: () {
                    model.navigateToAdd();
                  },
                  child: const CustomPluginPageListTile(
                    leadingIcon: Icon(
                      Icons.add,
                      color: AppColors.zuriPrimaryColor,
                    ),
                    text: 'Add plugin',
                    textColor: AppColors.zuriPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                CustomPluginPageListTile(
                  leadingIcon: SvgPicture.asset(
                    'assets/plugin_icons/plugin_msg_icon.svg',
                    width: 20,
                  ),
                  text: 'Quick message plugin',
                  textColor: const Color(0xFF242424),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
