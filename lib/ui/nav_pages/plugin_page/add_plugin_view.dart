import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:zurichat/ui/nav_pages/plugin_page/widgets/custom_search_field.dart';
import 'package:zurichat/ui/shared/styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

class AddPluginView extends StatelessWidget {
  final log = getLogger('AddPluginView');
  AddPluginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
      viewModelBuilder: () => PluginViewModel(),
      builder: (BuildContext context, PluginViewModel model, Widget? children) {
        return Scaffold(
          appBar: ZuriAppBar(
            leading: Icons.close,
            leadingPress: () {
              model.navigateToPlugins();
            },
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
                    onTap: () {
                      model.navigateToPlugins();
                    }),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
            child: ListView(
              children: const [
                SizedBox(
                  height: 40.0,
                  child: CustomSearchField(
                    searchHint: 'Search plugin',
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
