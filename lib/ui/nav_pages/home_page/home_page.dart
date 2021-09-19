import 'package:flutter/material.dart';
import 'package:hng/general_widgets/easy_container.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_expanded.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_topbar.dart';
import 'package:hng/ui/shared/text_field.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'home_page_viewmodel.dart';
import 'widgets/custom_channel_list_tile.dart';
import 'widgets/custom_dm_list_tile.dart';
import 'widgets/custom_homepage_section_title.dart';
import 'widgets/custom_plugin_list_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      onModelReady: (model) {
        model.getHomePageData();
      },
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, vmodel, child) => Column(
        children: [
          HomePageTopBar(
            organizationName: 'Zuri Workspace',
          ),
          Expanded(
            child: body(vmodel),
          )
        ],
      ),
    );
  }

  Widget body(HomePageViewModel vmodel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          searchBar(),
          Padding(
            padding: const EdgeInsets.fromLTRB(zSideMargin, 10, zSideMargin, 3),
            child: ThreadTextAndIcon(),
          ),
          Divider(),
          HomeExpandedList(
            title: 'Unreads',
            canExpand: false,
            data: vmodel.unreads,
          ),
          Divider(),
          HomeExpandedList(
            title: 'Channels',
            data: vmodel.joinedChannels,
          ),
          Divider(),
          HomeExpandedList(
            title: 'Direct Messages',
            data: vmodel.directMessages,
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
      child: EasyContainer(
        height: 50,
        radius: 7,
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        alignment: Alignment.centerLeft,
        borderWidth: 1.5,
        borderColor: Colors.grey[300],
        child: Text(
          'Jump to...',
          style: ZuriTextStyle.mediumNormal(),
        ),
      ),
    );
  }
}

/*class HomePage extends StatelessWidget {
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
                onTap: () {
                  model.navigateToUserSearchView();
                },
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DmScreen()));
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
      ),
    );
  }
}*/
