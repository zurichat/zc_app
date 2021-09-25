import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../general_widgets/easy_container.dart';
import '../../../utilities/constants.dart';
import '../../shared/colors.dart';
import '../../shared/search_bar.dart';
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
      },
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, model, child) => Column(
        children: [
          const HomePageTopBar(
            organizationName: 'Zuri Organization',
          ),
          model.isBusy
              ? LinearProgressIndicator(
                  backgroundColor: Colors.grey[400],
                  valueColor:
                      const AlwaysStoppedAnimation(AppColors.zuriPrimaryColor),
                )
              : Container(),
          Expanded(
            child: body(model),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  onPressed: model.navigateToStartDMScreen,
                  child: const Icon(
                    Icons.open_in_new_outlined,
                    color: AppColors.whiteColor,
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget body(HomePageViewModel model) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          JumpToSearchBar(onTap: () => model.navigateToJumpToScreen()),
          const Padding(
            padding: EdgeInsets.fromLTRB(zSideMargin, 10, zSideMargin, 3),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.fromLTRB(zSideMargin, 10, zSideMargin, 3),
            child: ThreadTextAndIcon(
              onTap: model.navigateToThreads,
            ),
          ),
          const Divider(),
          HomeExpandedList(
            title: 'Unreads',
            canExpand: false,
            data: model.unreads,
          ),
          const Divider(),
          HomeExpandedList(
            title: 'Channels',
            data: model.joinedChannels,
          ),
          const Divider(),
          HomeExpandedList(
            title: 'Direct Messages',
            data: model.directMessages,
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
