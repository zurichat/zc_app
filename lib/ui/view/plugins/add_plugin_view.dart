import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/app/app.logger.dart';
import 'package:stacked/stacked.dart';

import 'plugin_viewmodel.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_plugin_list_tile.dart';
import 'widgets/custom_search_field.dart';

class AddPluginView extends StatelessWidget {
  final log = getLogger('AddPluginView');
 AddPluginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? child) {
        return Scaffold(
          appBar: CustomAppBars(
            appbarTitle: 'Add Plugin',
            appbarAction: 'Add',
            model: model,
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
            child: Column(
              children: [
                Container(
                    height: 40.0,
                    child: CustomSearchField(
                      searchHint: 'Search people to add',
                    )),
                SizedBox(
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
                        textColor: Color(0xFF242424),
                      ),
                    ),
                    SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: Checkbox(
                        checkColor: Colors.white,
                        value: model.checked,
                        onChanged: (bool? value) {
                          model.setChecked(value!);
                          log.i(value);
                        },
                      ),
                    )
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
