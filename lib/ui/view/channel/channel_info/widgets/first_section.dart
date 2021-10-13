import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hng/constants/app_strings.dart';

import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
import '../../../../shared/colors.dart';

class FirstSection extends StatelessWidget {
  const FirstSection(this.model, {Key? key}) : super(key: key);
  final ChannelInfoViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkThemePrimaryColor
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#${model.channelName}",
            style: AppTextStyle.darkGreySize16Bold,
          ),
          const SizedBox(height: 25),
          Text(
            Description,
            style: AppTextStyle.darkGreySize16Bold,
          ),
          const SizedBox(height: 10),
          Text(
            '${model.channelDescription}',
            style: AppTextStyle.darkGreySize16.copyWith(letterSpacing: 0.005),
          ),
          const SizedBox(height: 10),
          Text(
            MarkCreatedChannel,
            style: AppTextStyle.lightGreySize16.copyWith(letterSpacing: 0.005),
          ),
          const SizedBox(height: 20),
          Text(
            Topic,
            style: AppTextStyle.darkGreySize16Bold,
          ),
          const SizedBox(height: 10),
          Text(
            CreatingZuri,
            style: AppTextStyle.darkGreySize16.copyWith(fontSize: 16.sp),
          ),
          const SizedBox(height: 25),
          const Divider(
            thickness: 0.5,
            color: AppColors.borderColor,
          ),
          const SizedBox(height: 15),
          Center(
            child: InkWell(
              onTap: () {
                model.navigateToEditChannel();
              },
              child: Text(
                Edit,
                style: AppTextStyle.darkGreySize16Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
