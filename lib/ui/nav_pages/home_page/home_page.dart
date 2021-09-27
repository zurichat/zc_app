import 'package:flutter/material.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_expanded.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_topbar.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/easy_container.dart';
import '../../../utilities/constants.dart';
import '../../shared/colors.dart';
import '../../shared/search_bar.dart';
import '../../shared/text_styles.dart';
import 'home_page_viewmodel.dart';
import 'widgets/custom_channel_list_tile.dart';
import 'widgets/custom_dm_list_tile.dart';
import 'widgets/custom_homepage_section_title.dart';
import 'widgets/custom_plugin_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      onModelReady: (model) {
        model.getDmAndChannelsList();
        model.getNewChannelStream();
      },
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, vmodel, child) => SafeArea(
        child: Column(
          children: [
            HomePageTopBar(
              organizationName: vmodel.orgName,
            ),
            vmodel.isBusy
                ? LinearProgressIndicator(
                    backgroundColor: Colors.grey[400],
                    valueColor: const AlwaysStoppedAnimation(
                        AppColors.zuriPrimaryColor),
                  )
                : Container(),
            Expanded(
              child: body(vmodel),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: FloatingActionButton(
            //         onPressed: vmodel.navigateToStartDMScreen,
            //         child: const Icon(
            //           Icons.open_in_new_outlined,
            //           color: AppColors.whiteColor,
            //         )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget body(HomePageViewModel vmodel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          searchBar(vmodel),
          const Padding(
            padding: EdgeInsets.fromLTRB(zSideMargin, 10, zSideMargin, 3),
            child: ThreadTextAndIcon(),
          ),
          const Divider(),
          HomeExpandedList(
            title: 'Unreads',
            canExpand: false,
            data: vmodel.unreads,
          ),
          const Divider(),
          HomeExpandedList(
            title: 'Channels',
            data: vmodel.joinedChannels,
          ),
          const Divider(),
          HomeExpandedList(
            title: 'Direct Messages',
            data: vmodel.directMessages,
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget searchBar(HomePageViewModel vmodel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
      child: GestureDetector(
        onTap: () => vmodel.onJumpToScreen(),
        child: EasyContainer(
          height: 50,
          radius: 7,
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          alignment: Alignment.centerLeft,
          borderWidth: 1.5,
          borderColor: Colors.grey[300],
          child: Text(
            'Jump to...',
            style: ZuriTextStyle.mediumNormal(),
          ),
        ),
      ),
    );
  }
}
