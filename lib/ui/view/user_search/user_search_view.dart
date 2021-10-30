import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../nav_pages/home_page/widgets/custom_channel_list_tile.dart';
import '../../nav_pages/home_page/widgets/custom_plugin_list_tile.dart';
import 'user_search_viewmodel.dart';

class UserSearchView extends StatelessWidget {
  const UserSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserSearchViewModel>.reactive(
      viewModelBuilder: () => UserSearchViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: ZuriAppBar(
          isSearchBar: true,
          hintText: 'Search for people here',
          searchBarIcon: Icons.arrow_back_ios,
          leadingWidth: true,

          /// THERE ARE OTHER SEARCH BAR OPTIONS IN THIS WIDGET
          /// KINDLY CHECK THROUGH AND USE.
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Column(
                children: [
                  const CustomChannelListTile(
                    channelName: 'Browse channels',
                    isActive: true,
                    pressed: null,
                    data: '1',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const CustomChannelListTile(
                    channelName: 'Browse channels',
                    isActive: true,
                    pressed: null,
                    data: '1',
                  ),
                  const SizedBox(height: 20.0),
                  const Text('Recent searches'),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomPluginListTile(
                        icon: Icons.access_time,
                        pluginName: 'in:#project-socrates Productbob',
                        isActive: false,
                      ),
                      CustomPluginListTile(
                        icon: Icons.clear,
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomPluginListTile(
                        icon: Icons.access_time,
                        pluginName: 'has:stage 4',
                        isActive: false,
                      ),
                      CustomPluginListTile(
                        icon: Icons.clear,
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Text('Narrow your search'),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomPluginListTile(
                        icon: Icons.add_box_outlined,
                        pluginName: 'to:',
                        isActive: false,
                      ),
                      Text('E.g. #project-socrates')
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomPluginListTile(
                        icon: Icons.add_box_outlined,
                        pluginName: 'from:',
                        isActive: false,
                      ),
                      Text('E.g. Adediwura Emmanuel')
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomPluginListTile(
                        icon: Icons.add_box_outlined,
                        pluginName: 'has:',
                        isActive: false,
                      ),
                      Text('E.g. star')
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomPluginListTile(
                        icon: Icons.add_box_outlined,
                        pluginName: 'after:',
                        isActive: false,
                      ),
                      Text('Ex: 08-31-2021')
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomPluginListTile(
                        icon: Icons.add_box_outlined,
                        pluginName: 'to:',
                        isActive: false,
                      ),
                      Text('E.g. me')
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
