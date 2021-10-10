import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng/ui/shared/bottom_sheets/zuri_chat_bottomsheet.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked/stacked.dart';

class ChannelChat extends ViewModelWidget<ChannelPageViewModel> {
  const ChannelChat({
    Key? key,
    this.channelId,
  }) : super(key: key);
  final String? channelId;

  @override
  Widget build(BuildContext context, ChannelPageViewModel viewModel) {
    final message = viewModel.channelUserMessages;
    return Container(
      child: !nullListChecker(viewModel.channelUserMessages)
          ? ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: viewModel.channelUserMessages!.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  log.i('Tap');
                },
                onLongPress: () => zuriChatBottomSheet(
                    context: context,
                    addToSavedItems: () {
                      viewModel.saveItem(
                          channelID: message![index].channelId,
                          channelName: message[index].channelName,
                          displayName: message[index].displayName,
                          message: message[index].message,
                          lastSeen: message[index].lastSeen,
                          messageID: message[index].id,
                          userID: message[index].userId,
                          userImage: message[index].userImage);
                      log.i("Saved");
                      viewModel.exitPage();
                      showSimpleNotification(
                        const Text("Added successfully"),
                        position: NotificationPosition.top,
                        background: AppColors.appBarGreen,
                        trailing: const Icon(Icons.mark_chat_read_outlined),
                        duration: const Duration(seconds: 3),
                      );
                    },
                    copyText: () {
                      Clipboard.setData(
                        ClipboardData(text: message![index].message),
                      );
                      viewModel.exitPage();
                      showSimpleNotification(
                        const Text("Copied!"),
                        position: NotificationPosition.top,
                        background: AppColors.appBarGreen,
                        trailing: const Icon(Icons.copy_outlined),
                        duration: const Duration(seconds: 3),
                      );
                    }),
                child: ThreadCardView.threadChannelMain(
                    viewModel.channelUserMessages![index]),
              ),
            )
          : Container(),
    );
  }
}
