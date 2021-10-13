import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/general_widgets/easy_container.dart';
import 'package:hng/ui/nav_pages/home_page/home_page_viewmodel.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_expanded.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  final Widget? organizationLogo;
  const HomePage({Key? key, this.organizationLogo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      onModelReady: (model) {
        model.getDmAndChannelsList();
        model.getNewChannelStream();
        model.hasDrafts();
        model.listenToNotificationTap();
      },
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, vmodel, child) => Scaffold(
        appBar: ZuriAppBar(
          leadingWidth: true,
          orgTitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => vmodel.navigateToOrganization(),
                child: const Image(
                  image: appBarLogo,
                  fit: BoxFit.cover,
                  height: 25,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                vmodel.orgName,
                style: AppTextStyle.organizationNameText,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  vmodel.isBusy
                      ? LinearProgressIndicator(
                          backgroundColor: Colors.grey[400],
                          valueColor: const AlwaysStoppedAnimation(
                              AppColors.zuriPrimaryColor),
                        )
                      : Container(),
                  Expanded(
                    child: body(context, vmodel),
                  ),
                ],
              ),
              Positioned(
                bottom: 17,
                right: 17,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: vmodel.navigateToStartDMScreen,
                    child: const Icon(
                      Icons.open_in_new_outlined,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: vmodel.navigateToStartDMScreen,
          child: IconButton(
            onPressed: vmodel.navigateToStartDMScreen,
            icon: SvgPicture.asset('assets/icons/svg_icons/create_msg.svg'),
            color: AppColors.whiteColor,
          ),
          backgroundColor: AppColors.zuriPrimaryColor,
        ),
      ),
    );
  }

  Widget body(BuildContext context, HomePageViewModel vmodel) {
    final local = AppLocalization.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15),
          searchBar(vmodel),
          const Padding(
            padding: EdgeInsets.fromLTRB(zSideMargin, 10, zSideMargin, 3),
            child: ThreadTextAndIcon(),
          ),
          vmodel.hasDrafts()
              ? const Padding(
                  padding: EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 3),
                  child: DraftTextAndIcon())
              : Container(),
          const Divider(),
          HomeExpandedList(
            title: local!.unreads,
            canExpand: false,
            data: vmodel.unreads,
          ),
          const Divider(),
          HomeExpandedList(
            title: local.channels,
            data: vmodel.joinedChannels,
          ),
          const Divider(),
          HomeExpandedList(
            title: local.directMessages,
            data: vmodel.directMessages,
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget searchBar(vmodel) {
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
            JumpTo,
            style: AppTextStyle.darkGreySize14,
          ),
        ),
      ),
    );
  }
}
