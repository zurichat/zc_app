import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/colors.dart';

import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
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
            border: Border.all(width: 1, color: AppColors.borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 6,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.archive_rounded,
              color: AppColors.deepBlackColor,
              size: 28,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Archive Channel',
                  style: AppTextStyle.errorSize14,
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Archiving the channel will remover it from the channel list, and close it from all members.'
                      'All chats and filse will still be stored and searchable',
                      style: AppTextStyle.darkGreySize14,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
