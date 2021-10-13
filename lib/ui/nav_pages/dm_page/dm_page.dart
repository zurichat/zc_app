import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';
import 'package:zurichat/ui/shared/zuri_loader.dart';

import '../../shared/search_bar.dart';
import 'dm_page_viewmodel.dart';
import 'widgets/dmmessage_unread.dart';

class DmPage extends StatelessWidget {
  const DmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmPageViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: ZuriAppBar(
            leadingWidth: true,
            orgTitle: Text(DMs, style: ZuriTextStyle.organizationNameText()),
            bottomNavBarScreen: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.navigateToDmScreen();
            },
            child: IconButton(
              onPressed: () {
                model.navigateToDmScreen();
              },
              icon: SvgPicture.asset('assets/icons/svg_icons/create_msg.svg'),
              color: AppColors.whiteColor,
            ),
            // backgroundColor: AppColors.zuriPrimaryColor,
          ),
          body: model.isBusy
              ? const ZuriLoader()
              : !model.data!
                  ? const Center(
                      child: Text("No Messages Yet"),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            JumpToSearchBar(
                                onTap: () => model.navigateToJumpToScreen(),
                                left: 6,
                                right: 6),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: model.getActiveDMs,
                              child: const DMMessageUnread(),
                            ),
                          ],
                        ),
                      ),
                    ),
        );
      },
      viewModelBuilder: () => DmPageViewModel(),
    );
  }
}
