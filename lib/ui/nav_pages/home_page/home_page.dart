import 'package:flutter/material.dart';
import 'package:hng/general_widgets/easy_container.dart';
import 'package:hng/ui/nav_pages/home_page/home_page_viewmodel.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_expanded.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_topbar.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked_viewmodel.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                    onPressed: vmodel.navigateToStartDMScreen,
                    child: const Icon(
                      Icons.open_in_new_outlined,
                      color: AppColors.whiteColor,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget body(HomePageViewModel vmodel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15),
          searchBar(vmodel),
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

  Widget searchBar(HomePageViewModel vmodel) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
      child: GestureDetector(
        onTap: () => vmodel.onJumpToScreen(),
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
      ),
    );
  }
}
