import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

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
            onPressed: model.navigateToDmScreen,
            child: const Icon(
              Icons.add,
            ),
            // backgroundColor: AppColors.zuriPrimaryColor,
          ),
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
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
