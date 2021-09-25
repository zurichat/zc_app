import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/colors.dart';
import '../../../../shared/styles.dart';
import '../channel_page_viewmodel.dart';

class CustomRow extends StatelessWidget {
  final ChannelPageViewModel model;

  CustomRow({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                model.navigateToChannelEdit();
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.zuriPrimaryColor),
                    shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/channel_page/edit_svg.svg',
                    width: 24,
                    color: AppColors.zuriPrimaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Add Description',
              style: AppTextStyles.body1Grey,
            )
          ],
        ),
        const SizedBox(width: 30),
        Column(
          children: [
            GestureDetector(
                onTap: () {}, //pressed,
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.zuriPrimaryColor),
                      shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/channel_page/add_people.svg',
                      width: 24,
                      color: AppColors.zuriPrimaryColor,
                    ),
                  ),
                )),
            const SizedBox(height: 5),
            Text(
              'Add People',
              style: AppTextStyles.body1Grey,
            )
          ],
        ),
      ],
    );
  }
}
