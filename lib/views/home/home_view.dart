// import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';
import '../../general_widgets/custom_bottom_nav.dart';
import '../../utilities/constants/constants.dart';
import '../../utilities/constants/styles.dart';
import 'widgets/custom_channel_list_tile.dart';
import 'widgets/custom_dm_list_tile.dart';
import 'widgets/custom_homepage_section_title.dart';
import 'widgets/custom_plugin_list_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.lightbulb,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                getThemeManager(context).toggleDarkLightTheme();
              })
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Image(
                image: appBarLogo,
                fit: BoxFit.cover,
                height: 48,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                height: 29,
                margin: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    hintText: 'Jump To...',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const CustomPluginListTile(
                icon: Icons.message_outlined,
                pluginName: 'Threads',
              ),
              const SizedBox(height: 16),
              const CustomPluginListTile(
                icon: Icons.scanner_outlined, //document_scanner_outlined,
                pluginName: 'Draft',
              ),
              const SizedBox(height: 16),
              const CustomPluginListTile(
                icon: Icons.file_copy,
                pluginName: 'Files',
              ),
              const SizedBox(height: 16),
              const CustomPluginListTile(
                icon: Icons.add_chart,
                pluginName: 'Integrate',
              ),
              const SizedBox(height: 24),
              const CustomHomePageSectionTitle(
                title: 'Channels',
              ),
              const SizedBox(height: 16),
              const CustomChannelListTile(
                channelName: 'announcements',
              ),
              const SizedBox(height: 16),
              const CustomChannelListTile(
                channelName: 'games',
              ),
              const SizedBox(height: 16),
              const CustomChannelListTile(
                channelName: 'general',
              ),
              const SizedBox(height: 16),
              const CustomChannelListTile(
                channelName: 'questions',
              ),
              const SizedBox(height: 20),
              const CustomHomePageSectionTitle(
                title: 'Direct Messages',
              ),
              const SizedBox(height: 16),
              const CustomDMListTile(
                userName: 'Princess',
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
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.open_in_new_outlined,
          color: whiteColor,
        ),
        backgroundColor: greenColor,
      ),
    );
  }
}
