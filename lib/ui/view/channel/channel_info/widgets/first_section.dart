import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/view/channel/channel_info/channel_info_view_model.dart';
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
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: AppColors.whiteColor,
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ]),
      // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#${model.channelName}",
            style: AppTextStyles.body1Bold,
          ),
          const SizedBox(height: 25),
          Text(
            Description,
            style: AppTextStyles.body1Bold,
          ),
          const SizedBox(height: 10),
          Text(
            '${model.channelDescription}',
            style: AppTextStyles.body1Light.copyWith(letterSpacing: 0.005),
          ),
          const SizedBox(height: 10),
          Text(
            MarkCreatedChannel,
            style: AppTextStyles.body1Regular.copyWith(letterSpacing: 0.005),
          ),
          const SizedBox(height: 20),
          Text(
            Topic,
            style: AppTextStyles.headerStyle1.copyWith(fontSize: 16.sp),
          ),
          const SizedBox(height: 10),
          Text(
            CreatingZuri,
            style: AppTextStyles.body1Light.copyWith(fontSize: 16.sp),
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
                style: AppTextStyles.bodyBig..copyWith(fontSize: 16.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
