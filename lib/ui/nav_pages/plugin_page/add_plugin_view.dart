import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/nav_pages/plugin_page/plugin_viewmodel.dart';
import 'package:hng/ui/nav_pages/plugin_page/widgets/custom_plugin_list_tile.dart';
import 'package:hng/ui/nav_pages/plugin_page/widgets/custom_search_field.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:stacked/stacked.dart';

class AddPluginView extends StatelessWidget {
  final log = getLogger('AddPluginView');
  AddPluginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PluginModel> plugins = [
      PluginModel(icon: "", name: "Holiday-Calendar", url: ""),
      PluginModel(icon: "", name: "Holiday-Calendar", url: ""),
      PluginModel(icon: "", name: "Holiday-Calendar", url: ""),
      PluginModel(icon: "", name: "Holiday-Calendar", url: ""),
      PluginModel(icon: "", name: "Holiday-Calendar", url: ""),
      PluginModel(icon: "", name: "Holiday-Calendar", url: ""),
      PluginModel(icon: "", name: "Holiday-Calendar", url: ""),
    ];

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
              children: [
                const SizedBox(
                  height: 40.0,
                  child: CustomSearchField(
                    searchHint: 'Search plugin',
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                for (PluginModel plugin in plugins) Plugins(plugin),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Plugins extends StatelessWidget {
  const Plugins(this.plugin, {Key? key}) : super(key: key);

  final PluginModel plugin;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PluginViewModel>.reactive(
        viewModelBuilder: () => PluginViewModel(),
        builder:
            (BuildContext context, PluginViewModel model, Widget? children) {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: CustomPluginPageListTile(
                    leadingIcon: SvgPicture.asset(
                      plugin.icon,
                      width: 20,
                    ),
                    text: plugin.name,
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
                ),
              ],
            ),
          );
        });
  }
}

class PluginModel {
  String icon;
  String name;
  String url;

  PluginModel({required this.icon, required this.name, required this.url});
}
