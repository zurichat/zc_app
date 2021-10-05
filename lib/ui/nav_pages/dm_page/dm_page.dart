import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/shared/zuri_appbar.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import '../../shared/search_bar.dart';
import 'dm_page_viewmodel.dart';
import 'widgets/dmmessage_read.dart';
import 'widgets/dmmessage_unread.dart';

class DmPage extends StatelessWidget {
  const DmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DmPageViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: ZuriTopBar(
            leadingWidth: true,
            orgTitle: Text(DMs, style: ZuriTextStyle.organizationNameText()),
            bottomNavBarScreen: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: AppColors.whiteColor,
            ),
            backgroundColor: AppColors.zuriPrimaryColor,
          ),
          body: SingleChildScrollView(
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
                    onTap: () => model.navigateToDmUserView(),
                    child: const DMMessageUnread(),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => model.navigateToDmUserView(),
                    child: const DMMessageRead(),
                  ),
                  const SizedBox(height: 20),
                  const DMMessageUnread(),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => model.navigateToDmUserView(),
                    child: const DMMessageRead(),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => model.navigateToDmUserView(),
                    child: const DMMessageRead(),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => model.navigateToDmUserView(),
                    child: const DMMessageRead(),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => model.navigateToDmUserView(),
                    child: const DMMessageRead(),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => model.navigateToDmUserView(),
                    child: const DMMessageRead(),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => model.navigateToDmUserView(),
                    child: const DMMessageRead(),
                  ),
                  const SizedBox(height: 30),
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
