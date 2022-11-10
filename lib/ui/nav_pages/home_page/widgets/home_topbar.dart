import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/shared.dart';
import '../../../../utilities/constants/text_styles.dart';
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
  Widget build(BuildContext context, viewModel) {
    //Todo:get the standard app bar height
    return Container(
      color: AppColors.zuriPrimaryColor,
      height: kToolbarHeight + 10,
      padding: const EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 6,
          color: Colors.black.withOpacity(0.1),
        )
      ]),
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                viewModel.navigateToOrganization();
              },
              child: organizationLogo ??
                  Container(
                    height: 35,
                    width: 35,
                    color: AppColors.whiteColor,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Image(
                      image: appBarLogo,
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                  ),
            ),
            const SizedBox(width: 16),
            Text(
              organizationName,
              style: AppTextStyle.organizationNameText,
            )
          ],
        ),
      ),
    );
  }
}
