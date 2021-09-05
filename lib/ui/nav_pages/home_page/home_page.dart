import 'package:flutter/material.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';



import '../../shared/shared.dart';
import '../../shared/colors.dart';
import '../../shared/constants.dart';
import 'home_page_viewmodel.dart';
import 'widgets/custom_channel_list_tile.dart';
import 'widgets/custom_dm_list_tile.dart';
import 'widgets/custom_homepage_section_title.dart';
import 'widgets/custom_plugin_list_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: InkWell(
                  child: Image(
                    image: appBarLogo,
                    fit: BoxFit.cover,
                    height: 48,
                  ),
                  onTap: () {
                    model.nToWorkspace();
                  },
                ),
              ),
            ],
          ),
          actions: [
            Text(
              model.status ? "Online" : "Offline",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
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
                  icon: Icons.message_outlined,
                  pluginName: 'Threads',
                ),
                const SizedBox(height: 16),
                const CustomPluginListTile(
                  // icon: Icons.document_scanner_outlined,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // navigation.navigateTo(Routes.loginView);
            // navigation.navigateTo('/create-work-space');
            model.nToPref();
            model.nToInfo();

          },
          child: const Icon(
            Icons.open_in_new_outlined,
          ),
        ),
      ),
    );
  }
}
