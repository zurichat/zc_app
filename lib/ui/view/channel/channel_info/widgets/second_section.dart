import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/constants/app_strings.dart';

import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'package:stacked/stacked.dart';
import '../../../../shared/colors.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChannelInfoViewModel>.reactive(
        viewModelBuilder: () => ChannelInfoViewModel(),
        builder: (context, model, child) => Card(
          elevation: 2,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(16.37, 0, 26, 26.37),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Switch(
                      onChanged: model.toggleNotification,
                      value: model.notification,
                      activeColor: AppColors.zuriPrimaryColor,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.notifications_outlined,
                      color: AppColors.deepBlackColor,
                    ),
                    UIHelper.horizontalSpaceMedium,
                    UIHelper.horizontalSpaceSmall,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Notifications,
                            style:
                            AppTextStyle.blackSize14Bold,
                          ),
                          UIHelper.verticalSpaceExtraSmall,
                          Text(
                            EveryNewMessage,
                            style:
                            AppTextStyle.darkGreySize14
                          ),
                          UIHelper.verticalSpaceMedium,
                          Text(
                            MuteChannel,
                            style:
                            AppTextStyle.blackSize14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
