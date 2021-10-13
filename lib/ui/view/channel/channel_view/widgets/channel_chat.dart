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
              itemBuilder: (context, index) {
                final userPost = viewModel.channelUserMessages![index];
                return InkWell(
                  child: ThreadCardView.threadChannelMain(userPost),
                  onLongPress: () => zuriChatBottomSheet(
                    shareMessage: () =>
                        viewModel.navigateToShareMessage(userPost),
                    changePinnedState: () async {
                      final didChange =
                          await viewModel.changePinnedState(userPost);
                      if (didChange) userPost.pinned = !userPost.pinned;
                      Navigator.of(context).pop();
                      showSimpleNotification(
                        Text(didChange
                            ? "${userPost.pinned ? "Pinned" : "Unpinned"} successfully"
                            : "Could not ${userPost.pinned ? "unpin" : "pin"} post"),
                        position: NotificationPosition.top,
                        background: didChange
                            ? AppColors.appBarGreen
                            : AppColors.redColor,
                        trailing: const Icon(Icons.push_pin_outlined),
                        duration: const Duration(seconds: 2),
                      );
                    },
                    addToSavedItems: () {
                      viewModel.saveItem(
                          channelID: message![index].channelId,
                          channelName: message[index].channelName,
                          displayName: message[index].displayName,
                          message: message[index].message,
                          lastSeen: message[index].moment,
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
                    },
                    turnQuestionToPoll: () {
                      viewModel.navigateToQuestionPollScreen();
                    },
                    context: context,
                    post: userPost,
                  ),
                  onTap: () {
                    log.i('Tap');
                  },
                );
              },
            )
          : Container(),
    );
  }
}
