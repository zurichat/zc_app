import 'package:flutter/material.dart';

import 'package:hng/ui/nav_pages/home_page/widgets/home_expanded.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_topbar.dart';
import 'package:hng/ui/shared/search_bar.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/utilities/constants.dart';

import 'package:stacked/stacked.dart';

import '../../../general_widgets/easy_container.dart';
import '../../../utilities/constants.dart';
import '../../shared/colors.dart';
import '../../shared/text_styles.dart';
import 'home_page_viewmodel.dart';
import 'widgets/home_expanded.dart';
import 'widgets/home_list_items.dart';
import 'widgets/home_topbar.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      onModelReady: (model) {
        model.getDmAndChannelsList();
        model.listenToChannelsChange();
      },
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, vmodel, child) => Column(
        children: [
          const HomePageTopBar(
            organizationName: 'Zuri Workspace',
          ),
          vmodel.isBusy
              ? LinearProgressIndicator(
                  backgroundColor: Colors.grey[400],
                  valueColor:
                      const AlwaysStoppedAnimation(AppColors.zuriPrimaryColor),
                )
              : Container(),
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
          const SizedBox(height: 15),
          searchBar(),
          const Padding(
            padding: EdgeInsets.fromLTRB(zSideMargin, 10, zSideMargin, 3),
          SizedBox(height: 15),
          JumpToSearchBar(onTap: () => vmodel.navigateToJumpToScreen()),
          Padding(
            padding: const EdgeInsets.fromLTRB(zSideMargin, 10, zSideMargin, 3),
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


  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
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
    );
  }

}
