import 'package:flutter/material.dart';

import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/ui/view/channel/channel_info/widgets/textstyles.dart';
import 'package:zurichat/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:stacked/stacked.dart';

class CheckUser extends ViewModelWidget<ChannelPageViewModel> {
  const CheckUser(this.channelId, this.channelName, {Key? key})
      : super(key: key);
  final String? channelId;
  final String? channelName;

  @override
  Widget build(BuildContext context, ChannelPageViewModel viewModel) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Divider(),
            RichText(
              text: TextSpan(
                text: 'you are viewing ',
                style: AppTextStyle.darkGreySize16,
                children: <TextSpan>[
                  TextSpan(text: '#', style: AppTextStyle.darkGreySize16Bold),
                  TextSpan(
                      text: '$channelName',
                      style: AppTextStyle.darkGreySize16Bold),
                ],
              ),
            ),
            // UIHelper.horizontalSpaceSmall,
            Container(
              margin: const EdgeInsets.only(top: 10),
              color: AppColors.zuriPrimaryColor,
              child: TextButton(
                onPressed: () {
                  viewModel.joinChannel('$channelId');
                  viewModel.updateCheckUser();
                },
                child: Text(
                  'Join Channel',
                  style: containerTextStyle(),
                ),
              ),
            ),

            const Divider(),
          ],
        ),
      ),
    );
  }
}
