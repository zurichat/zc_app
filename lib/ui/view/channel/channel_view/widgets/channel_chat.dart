import 'package:flutter/material.dart';
import 'package:zurichat/ui/shared/shared.dart';
import 'package:zurichat/ui/shared/smart_widgets/thread_card/thread_card_view.dart';
import 'package:zurichat/ui/shared/styles.dart';
import 'package:zurichat/ui/view/channel/channel_view/channel_page_viewmodel.dart';
import 'package:zurichat/utilities/utilities.dart';
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
                onLongPress: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      final message = viewModel.channelUserMessages;
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .75,
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text("Mark Unread",
                                  style: AppTextStyles.heading9),
                              leading: const Icon(Icons.line_style_outlined),
                            ),
                            ListTile(
                              title: Text("Remind Me",
                                  style: AppTextStyles.heading9),
                              leading: const Icon(Icons.timer_10_outlined),
                            ),
                            ListTile(
                              title: Text("Add to Saved Items",
                                  style: AppTextStyles.heading9),
                              leading: const Icon(Icons.save_outlined),
                              onTap: () {
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
                                  trailing:
                                      const Icon(Icons.mark_chat_read_outlined),
                                  duration: const Duration(seconds: 3),
                                );
                              },
                            ),
                            const Divider(),
                            ListTile(
                              title: Text("Reply in Thread",
                                  style: AppTextStyles.heading9),
                              leading: const Icon(Icons.chat_rounded),
                            ),
                            ListTile(
                              title: Text("Follow Thread",
                                  style: AppTextStyles.heading9),
                              leading: const Icon(Icons.mark_chat_unread),
                            ),
                            const Divider(),
                            ListTile(
                              title: Text("Share Message",
                                  style: AppTextStyles.heading9),
                              leading:
                                  const Icon(Icons.arrow_right_alt_rounded),
                            ),
                            ListTile(
                              title: Text("Copy Link to Message",
                                  style: AppTextStyles.heading9),
                              leading: const Icon(Icons.link),
                            ),
                            ListTile(
                              title: Text("Copy Text",
                                  style: AppTextStyles.heading9),
                              leading: const Icon(Icons.copy),
                            ),
                            const Divider(),
                            ListTile(
                                title: Text("Unpin from Conversation",
                                    style: AppTextStyles.heading9),
                                leading: const Icon(Icons.location_pin)),
                            ListTile(
                              title: Text("Turn question into poll",
                                  style: AppTextStyles.heading9),
                              leading: const Icon(Icons.bar_chart),
                              trailing: Text("Simple poll",
                                  style: AppTextStyles.subtitle),
                            ),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: ThreadCardView.threadChannelMain(
                    viewModel.channelUserMessages![index]),
              ),
            )
          : Container(),
    );
  }
}
