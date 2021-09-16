import 'package:flutter/material.dart';
import 'package:hng/general_widgets/easy_container.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:stacked/stacked.dart';

import '../home_page_viewmodel.dart';

class HomePageTopBar extends ViewModelWidget<HomePageViewModel> {
  final Widget? organizationLogo;
  final String organizationName;

  const HomePageTopBar({
    Key? key,
    this.organizationLogo,
    required this.organizationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, vmodel) {
    //Todo:get the standard app bar height
    return EasyContainer(
      color: AppColors.zuriPrimaryColor,
      height: kToolbarHeight + 30,
      padding: EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 3),
          blurRadius: 6,
          color: Colors.black.withOpacity(0.1),
        )
      ],
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                vmodel.navigateToWorkspace();
              },
              child: organizationLogo ??
                  EasyContainer(
                    height: 35,
                    width: 35,
                    color: AppColors.whiteColor,
                    alignment: Alignment.center,
                    radius: 6,
                    child: Image(
                      image: appBarLogo,
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                  ),
            ),
            SizedBox(width: 12),
            Text(
              organizationName,
              style: ZuriTextStyle.organisationNameText(),
            )
          ],
        ),
      ),
    );
  }
}
