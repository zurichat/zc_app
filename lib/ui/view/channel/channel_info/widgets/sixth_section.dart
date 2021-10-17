import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/models/channel_model.dart';
import 'package:zurichat/ui/shared/colors.dart';

import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/shared/ui_helpers.dart';
import 'package:zurichat/ui/view/channel/channel_info/channel_info_view_model.dart';
import 'package:stacked/stacked.dart';

class SixthSection extends ViewModelWidget<ChannelInfoViewModel> {
  final ChannelModel channelDetail;

  const SixthSection(this.channelDetail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ChannelInfoViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.deleteChannel(channelDetail),
      child: Container(
        height: 136,
        width: 395,
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(16, 18, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkThemePrimaryColor
              : AppColors.whiteColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              archive,
              color: Theme.of(context).textTheme.bodyText1!.color,
              width: 28,
              height: 28,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ArchiveChannel,
                    style: AppTextStyle.errorSize14,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        ArchiveChannelWarning,
                        style: AppTextStyle.darkGreySize14,
                      )),
                ],
              ),
            ),
            UIHelper.horizontalSpaceMedium,
          ],
        ),
      ),
    );
  }
}
