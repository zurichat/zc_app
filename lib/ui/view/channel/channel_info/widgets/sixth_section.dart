import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/view/channel/channel_info/widgets/textstyles.dart';
import 'package:stacked/stacked.dart';

import '../channel_info_view_model.dart';

class SixthSection extends ViewModelWidget<ChannelInfoViewModel> {
  const SixthSection({Key? key, required this.channelDetail}) : super(key: key);

  final ChannelModel channelDetail;

  @override
  Widget build(BuildContext context, ChannelInfoViewModel model) {
    return GestureDetector(
      onTap: () => model.deleteChannel(channelDetail),
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 5, left: 5, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(width: 1.0, color: AppColors.borderColor),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 9,
                    top: 19,
                  ),
                  child: const Icon(
                    Icons.lock_outline,
                    color: AppColors.deepBlackColor,
                    size: 28,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 11,
                    top: 19,
                    bottom: 10,
                  ),
                  child: Text(
                    'Archive Channel',
                    style: archiveTextStyle(),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 45, bottom: 10),
              child: const Text(
                'Archiving the channel will remover it from the channel list, and close it from all members.'
                'All chats and filse will still be stored and searchable',
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
