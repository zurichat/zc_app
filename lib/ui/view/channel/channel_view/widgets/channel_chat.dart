import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/ui/shared/bottom_sheets/zuri_chat_bottomsheet.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:zurichat/ui/shared/text_styles.dart';
import 'package:zurichat/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:zurichat/utilities/internalization/localization/app_localization.dart';
import 'package:zurichat/utilities/utilities.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked/stacked.dart';

class ChannelChat extends ViewModelWidget<ChannelPageViewModel> {
  const ChannelChat({
    Key? key,
    this.channelId,
    this.controller,
  }) : super(key: key);
  final String? channelId;
  // ignore: prefer_typing_uninitialized_variables
  final controller;

  @override
  Widget build(BuildContext context, ChannelPageViewModel viewModel) {
    final local = AppLocalization.of(context);
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
                  child: Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        if (userPost.pinned) ...[
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Row(
                              children: [
                                const Icon(Icons.push_pin,
                                    size: 16.0, color: Colors.orange),
                                const SizedBox(width: 12.0),
                                Text(
                                  Pinned,
                                  style: AppTextStyle.lightGreySize14,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                        ],
                        ThreadCardView.threadChannelMain(userPost),
                      ],
                    ),
                    color: userPost.pinned
                        ? AppColors.lightYellow
                        : Colors.transparent,
                  ),
                  onLongPress: () => zuriChatBottomSheet(
                    editMessage: () {
                      Navigator.pop(context);
                      controller.text = message![index].message;
                      viewModel.notifyListeners();
                    },
                    shareMessage: () =>
                        viewModel.navigateToShareMessage(userPost),
                    changePinnedState: () async {
                      final didChange =
                          await viewModel.changePinnedState(userPost);
                      if (didChange) {
                        userPost.pinned = !userPost.pinned;
                      } else {
                        showSimpleNotification(
                          Text(
                              "${local!.couldNot} ${userPost.pinned ? local.unPinFrom : local.pinTo} ${local.post} "),
                          position: NotificationPosition.top,
                          background: AppColors.redColor,
                          trailing: const Icon(Icons.push_pin_outlined),
                          duration: const Duration(seconds: 2),
                        );
                      }
                      viewModel.notifyListeners();
                      viewModel.exitPage();
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
                      log.i(local!.saved);
                      viewModel.exitPage();
                      showSimpleNotification(
                        Text(local.addedSuccessfully),
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
