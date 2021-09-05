import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_bottom_nav.dart';
import 'package:hng/ui/nav_pages/home_page/home_page_viewmodel.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/custom_channel_list_tile.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/custom_dm_list_tile.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/custom_homepage_section_title.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/custom_plugin_list_tile.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
//import 'package:hng/ui/view/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<HomePageViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.greenColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: appBarLogo,
                        fit: BoxFit.cover,
                        height: 48,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: GestureDetector(
                        child: Icon(Icons.search),
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
              backgroundColor: AppColors.whiteColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.05,
                          margin: const EdgeInsets.only(top: 20),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Jump to...',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.borderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.borderColor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.024),
                        const CustomPluginListTile(
                          icon: Icons.chat_outlined,
                          pluginName: 'Threads',
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomChannelListTile(
                          channelName: 'chat-random',
                          isActive: true,
                          data: '22',
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomPluginListTile(
                          icon: Icons.lock_rounded,
                          pluginName: 'stage4',
                          isActive: true,
                          data: '3',
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomChannelListTile(
                          channelName: 'games',
                          isActive: true,
                          data: '1',
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomPluginListTile(
                          icon: Icons.lock_rounded,
                          pluginName: 'dm_plus_entrepreneurs',
                          isActive: true,
                          data: '1',
                        ),
                        // const CustomPluginListTile(
                        //   icon: Icons.document_scanner_outlined,
                        //   pluginName: 'Draft',
                        // ),
                        //  SizedBox(height: size.height*0.02),
                        // const CustomPluginListTile(
                        //   icon: Icons.file_copy,
                        //   pluginName: 'Files',
                        // ),
                        SizedBox(height: size.height * 0.032),
                        // const CustomPluginListTile(
                        //   icon: Icons.add_chart,
                        //   pluginName: 'Integrate',
                        // ),
                        // const SizedBox(height: 24),
                        const CustomHomePageSectionTitle(
                          title: 'Channels',
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomChannelListTile(
                          channelName: 'announcement',
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomPluginListTile(
                          icon: Icons.lock_outline_rounded,
                          pluginName: 'team-socrates',
                          isActive: false,
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomChannelListTile(
                          channelName: 'questions',
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomPluginListTile(
                          icon: Icons.add_box_rounded,
                          pluginName: 'Add channel',
                          isActive: false,
                        ),
                        SizedBox(height: size.height * 0.036),
                        const CustomHomePageSectionTitle(
                          title: 'Direct Messages',
                        ),
                        SizedBox(height: size.height * 0.02),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: AppColors.greenColor,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Zuri chat',
                                    style: TextStyle(
                                      color: AppColors.deepBlackColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: size.height * 0.02),
                        const CustomDMListTile(
                          userName: 'Princess(you)',
                          imagelink: dummyUserImage,
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomDMListTile(
                          userName: 'Tobi',
                          imagelink: dummyUserImage,
                        ),
                        SizedBox(height: size.height * 0.02),
                        const CustomDMListTile(
                          userName: 'Victor',
                          imagelink: dummyUserImage,
                        ),
                        SizedBox(height: size.height * 0.02),
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
              bottomNavigationBar: CustomBottomNavBar(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.open_in_new_outlined,
                  color: AppColors.whiteColor,
                ),
                backgroundColor: AppColors.greenColor,
              ),
            ),
        viewModelBuilder: () => HomePageViewModel());
  }
}
