import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/widgets/custom_plugin_list_tile.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/widgets/custom_search_field.dart';
import 'package:zurichat/ui/shared/styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';
import 'plugin_viewmodel.dart';

class AddPluginView extends StatelessWidget {
  final log = getLogger('AddPluginView');
  AddPluginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? child) {
        return Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.close,
            whiteBackground: true,
            orgTitle: Text(
              'Add Plugins',
              style: AppTextStyles.heading7,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 20.0, 0.0),
                child: InkWell(
                    child: Text(
                      Add,
                      style: AppTextStyles.body1Green,
                    ),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {}),
              ),
            ],
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
            child: Column(
              children: [
                const SizedBox(
                    height: 40.0,
                    child: CustomSearchField(
                      searchHint: 'Search people to add',
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

                        //TODO change color to brand colors
                        textColor: const Color(0xFF242424),
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
