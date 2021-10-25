import 'package:flutter/material.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_appbar.dart';
import 'package:zurichat/ui/shared/dumb_widgets/zuri_loader.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';
import 'package:stacked/stacked.dart';

import '../../shared/dumb_widgets/search_bar.dart';
import 'dm_page_viewmodel.dart';
import 'widgets/dmmessage_unread.dart';

class DmPage extends StatelessWidget {
  const DmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmPageViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        final local = AppLocalization.of(context);
        final bool _dark = Theme.of(context).brightness == Brightness.dark;
        return Scaffold(
          appBar: ZuriAppBar(
            isDarkMode: _dark,
            leadingWidth: true,
            orgTitle: Text(local!.directMessages,
                style: AppTextStyle.organizationNameText),
            bottomNavBarScreen: true,
          ),
          //TODO
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     model.navigateToDmScreen();
          //   },
          //   child: IconButton(
          //     onPressed: () {
          //       model.navigateToDmScreen();
          //     },
          //     icon: SvgPicture.asset('assets/icons/svg_icons/create_msg.svg'),
          //     color: AppColors.whiteColor,
          //   ),
          //   // backgroundColor: AppColors.zuriPrimaryColor,
          // ),
          body: model.isBusy
              ? const ZuriLoader()
              : !model.data!
                  ? Center(
                      child: Text(local.temporarilyUnavailable,
                          style: _dark
                              ? AppTextStyle.whiteSize18Bold
                              : AppTextStyle.darkGreySize18Bold),
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
