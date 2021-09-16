import 'package:flutter/material.dart';
import 'package:hng/general_widgets/easy_container.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/text_styles.dart';

class HomePageTopBar extends StatelessWidget {
  final Widget? organizationLogo;
  final String organizationName;

  const HomePageTopBar({
    Key? key,
    this.organizationLogo,
    required this.organizationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Todo:get the standard app bar height
    return Container(
      color: AppColors.zuriPrimaryColor,
      height: kToolbarHeight + 30,
      padding: EdgeInsets.fromLTRB(zSideMargin, 0, zSideMargin, 0),
      child: SafeArea(
        child: Row(
          children: [
            organizationLogo ??
                EasyContainer(
                  height: 35,
                  width: 35,
                  color: AppColors.whiteColor,
                  radius: 6,
                ),
            SizedBox(width: 12),
            Text(
              organizationName,
              style: ZuriTextStyle.largeBold(),
            )
          ],
        ),
      ),
    );
  }
}
