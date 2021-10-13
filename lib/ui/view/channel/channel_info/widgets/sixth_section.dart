import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/channel/channel_info/channel_info_view_model.dart';
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
          width: 395,
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
              const SizedBox(width: 26,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Archive Channel',
                      style:
                          AppTextStyles.archiveTextStyle2.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 6,),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Archiving the channel will remover it from the channel list, and close it from all members.'
                          'All chats and files will still be stored and searchable',
                          style: AppTextStyles.body2_400.copyWith(fontSize: 14),
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
