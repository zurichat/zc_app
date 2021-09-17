import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user_model.dart';
import '../../../utilities/constants.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import '../dm_page/dm_search_find_page.dart';
import 'home_page_viewmodel.dart';
import 'widgets/custom_channel_list_tile.dart';
import 'widgets/custom_dm_list_tile.dart';
import 'widgets/custom_homepage_section_title.dart';
import 'widgets/custom_plugin_list_tile.dart';
import 'widgets/zuri_logo.dart';

class HomePage extends StatelessWidget {
  // final UserModel? userModel;

  // const HomePage({Key? key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.zuriPrimaryColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 5.0),
                child: InkWell(
                  child: ZuriLogo(),
                  onTap: () {
                    model.nToWorkspace();
                  },
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 4, right: 12),
              child: GestureDetector(
                child: Icon(Icons.search, color: AppColors.whiteColor),
                onTap: () {},
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Column(
                children: [
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        hintText: 'Jump to...',
                        hintStyle: AppTextStyles.normalText,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CustomPluginListTile(
                    assetName: threadIcon,
                    pluginName: 'Threads',
                  ),
                  const SizedBox(height: 16),
                  const CustomPluginListTile(
                    assetName: draftIcon,
                    pluginName: 'Drafts',
                  ),
                  const SizedBox(height: 16),
                  const CustomChannelListTile(
                    channelName: 'chat-random',
                    isActive: true,
                    data: '22',
                  ),
                  const SizedBox(height: 16),
                  const CustomPluginListTile(
                    assetName: lockIconShaded,
                    pluginName: 'stage4',
                    isActive: true,
                    data: '3',
                  ),
                  const SizedBox(height: 16),
                  const CustomChannelListTile(
                    channelName: 'games',
                    isActive: true,
                    data: '1',
                  ),
                  const SizedBox(height: 16),
                  const CustomPluginListTile(
                    assetName: lockIconShaded,
                    pluginName: 'dm_plus_entrepreneurs',
                    isActive: true,
                    data: '1',
                  ),
                  const SizedBox(height: 16),
                  const CustomPluginListTile(
                    icon: Icons.file_copy,
                    pluginName: 'Files',
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 16),
                  const CustomHomePageSectionTitle(
                    title: 'Channels',
                  ),
                  const SizedBox(height: 16),
                  const CustomChannelListTile(
                    channelName: 'announcement',
                  ),
                  const SizedBox(height: 16),
                  const CustomPluginListTile(
                    assetName: lockIcon,
                    pluginName: 'team-socrates',
                    isActive: false,
                  ),
                  const SizedBox(height: 16),
                  const CustomChannelListTile(
                    channelName: 'questions',
                  ),
                  const SizedBox(height: 16),
                  const CustomPluginListTile(
                      icon: Icons.add_box_rounded,
                      pluginName: 'Add channel',
                      isActive: false,
                    ),
                
                  const SizedBox(height: 16),
                  CustomHomePageSectionTitle(
                    title: 'Direct Messages',
                    ontap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const DmScreen()));
                    },
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: AppColors.zuriPrimaryColor,
                              size: 16,
                            ),
                            const SizedBox(width: 8),
                            Text('Zuri-chat', style: AppTextStyles.timestamp),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CustomDMListTile(
                    userName: 'Princess (You)',
                    imagelink: dummyUserImage,
                  ),
                  const SizedBox(height: 16),
                  const CustomDMListTile(
                    userName: 'Tobi',
                    imagelink: dummyUserImage,
                  ),
                  const SizedBox(height: 16),
                  const CustomDMListTile(
                    userName: 'Victor',
                    imagelink: dummyUserImage,
                  ),
                  const SizedBox(height: 16),
                  const CustomDMListTile(
                    userName: 'Fierce',
                    imagelink: dummyUserImage,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.open_in_new_outlined,
            color: AppColors.whiteColor,
          ),
          backgroundColor: AppColors.zuriPrimaryColor,
        ),
      ),
    );
  }
}
