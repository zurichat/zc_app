import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/bottom_sheets/zuri_chat_bottomsheet.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/smart_widgets/text_parser/text_parser_view.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/widgets/audio_message.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked/stacked.dart';

import '../thread_card_viewmodel.dart';
import 'emojis_list.dart';
import 'media_files.dart';
import 'post_files_display.dart';
import 'post_replies.dart';
import 'quoted_replies.dart';
import 'snapshot_links.dart';
import 'package:hng/app/app.logger.dart';

class ThreadChannelMain extends ViewModelWidget<ThreadCardViewModel> {
  ThreadChannelMain(this.userPost, {Key? key}) : super(key: key);

  final log = getLogger("ThreadChannelMain");
  final UserPost userPost;

  @override
  Widget build(BuildContext context, ThreadCardViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.navigateToThread(userPost),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: viewModel.viewProfile,
              onLongPress: () => zuriChatBottomSheet(
                changePinnedState: () async {
                  final didChange = await viewModel.changePinnedState(userPost);
                  if (didChange) userPost.pinned = !userPost.pinned;
                  viewModel.goBack();
                  showSimpleNotification(
                    Text(didChange
                        ? "${userPost.pinned ? "Pinned" : "Unpinned"} successfully"
                        : "Could not ${userPost.pinned ? "unpin" : "pin"} post"),
                    position: NotificationPosition.top,
                    background:
                        didChange ? AppColors.appBarGreen : AppColors.redColor,
                    trailing: const Icon(Icons.push_pin_outlined),
                    duration: const Duration(seconds: 2),
                  );
                },
                addToSavedItems: () {
                  viewModel.saveItem(
                      channelID: userPost.channelId,
                      channelName: userPost.channelName,
                      displayName: userPost.displayName,
                      message: userPost.message,
                      lastSeen: userPost.moment,
                      messageID: userPost.id,
                      userID: userPost.userId,
                      userImage: userPost.userImage);
                  log.i("Saved");
                  viewModel.goBack();
                  showSimpleNotification(
                    const Text("Added successfully"),
                    position: NotificationPosition.top,
                    background: AppColors.appBarGreen,
                    trailing: const Icon(Icons.mark_chat_read_outlined),
                    duration: const Duration(seconds: 3),
                  );
                },
                context: context,
                post: userPost,
              ),
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('${userPost.userImage}')),
                  )),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: CustomText(
                                text: '${userPost.displayName}',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${userPost.statusIcon}",
                              style: AppTextStyles.body2Medium,
                            ),
                            const SizedBox(width: 4),
                            CustomText(
                              text: '${userPost.moment}',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextParser(userPost.message),
                      ],
                    ),
                  ),
                  userPost.postSnapshotLinks!.isNotEmpty
                      ? SnapshotLinks(
                          postSnapshotLinks: userPost.postSnapshotLinks)
                      : Container(),
                  userPost.postAudioFiles!.isNotEmpty
                      ? AudioMessage(postAudioFiles: userPost.postAudioFiles)
                      : Container(),
                  userPost.postFiles!.isNotEmpty
                      ? PostFilesDisplay(postFiles: userPost.postFiles)
                      : Container(),
                  userPost.postQuotedReplies!.isNotEmpty
                      ? QuotedReplies(
                          postQuotedReplies: userPost.postQuotedReplies)
                      : Container(),
                  userPost.postMediaFiles!.isNotEmpty
                      ? MediaFiles(postMediaFiles: userPost.postMediaFiles)
                      : Container(),
                  userPost.postEmojis!.isNotEmpty
                      ? EmojisList(userPost: userPost)
                      : Container(),
                  userPost.userThreadPosts!.isNotEmpty
                      ? PostReplies(userPost: userPost)
                      : Container(),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
