import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/view/channel/channel_info/channel_info_view_model.dart';
import '../../../../shared/colors.dart';

class FirstSection extends StatelessWidget {
  const FirstSection(this.model, {Key? key, this.channelName, this.channelID})
      : super(key: key);
  final ChannelInfoViewModel model;
  final String? channelName;
  final String? channelID;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
            "#$channelName",
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
            style: AppTextStyles.headerStyle1,
          ),
          const SizedBox(height: 10),
          Text(
            CreatingZuri,
            style: AppTextStyles.body1Light,
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
                style: AppTextStyles.bodyBig,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
