import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/widgets/custom_appbar.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/widgets/custom_plugin_list_tile.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/widgets/custom_search_field.dart';
import 'package:stacked/stacked.dart';

import 'plugin_viewmodel.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_plugin_list_tile.dart';
import 'widgets/custom_search_field.dart';

class EditPluginView extends StatelessWidget {
  const EditPluginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? child) {
        return Scaffold(
          appBar: CustomAppBars(
            appbarTitle: 'Plugins',
            appbarAction: 'Done',
            model: model,
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
                Row(
                  children: [
                    Expanded(
                      child: CustomPluginPageListTile(
                        leadingIcon: SvgPicture.asset(
                          'assets/plugin_icons/plugin_msg_icon.svg',
                          width: 20,
                        ),
                        text: 'Quick message plugin',
                        textColor: const Color(0xFF242424),
                      ),
                    ),
                    SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: IconButton(
                          icon: const Icon(
                            Icons.clear,
                            size: 24.0,

                            //TODO change colors to brand colors
                            color: Color(0xFFF40101),
                          ),
                          onPressed: () {},
                        )),
                  ],
                )
              ],
            ),
          )),
        );
      },
    );
  }
}
