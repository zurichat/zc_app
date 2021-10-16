import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
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
      child: Card(
        elevation: 2,
        child: Container(
          height: 136,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(18, 18, 0, 42),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.archive_rounded,
                color: AppColors.deepBlackColor,
                size: 28,
              ),
              UIHelper.horizontalSpaceMedium,
              UIHelper.horizontalSpaceSmall,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ArchiveChannel,
                      style:
                      AppTextStyle.errorBoldSize14,
                    ),
                    UIHelper.verticalSpaceSmall,
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          ArchiveChannelWarning,
                          style: AppTextStyle.blackSize14,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
