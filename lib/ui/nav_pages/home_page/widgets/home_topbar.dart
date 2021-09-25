import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../general_widgets/easy_container.dart';
import '../../../shared/colors.dart';
import '../../../shared/shared.dart';
import '../../../shared/text_styles.dart';
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
      padding: const EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 6,
          color: Colors.black.withOpacity(0.1),
        )
      ],
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                vmodel.navigateToOrganization();
              },
              child: organizationLogo ??
                  EasyContainer(
                    height: 35,
                    width: 35,
                    color: AppColors.whiteColor,
                    alignment: Alignment.center,
                    radius: 6,
                    child: const Image(
                      image: appBarLogo,
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                  ),
            ),
            const SizedBox(width: 12),
            Text(
              organizationName,
              style: ZuriTextStyle.organizationNameText(),
            )
          ],
        ),
      ),
    );
  }
}
