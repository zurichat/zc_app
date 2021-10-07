import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/shared/smart_widgets/text_parser/text_parser_view.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/widgets/audio_message.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:stacked/stacked.dart';

import '../thread_card_viewmodel.dart';
import 'emojis_list.dart';
import 'media_files.dart';
import 'post_files_display.dart';
import 'post_replies.dart';
import 'quoted_replies.dart';
import 'snapshot_links.dart';

class ThreadChannelMain extends ViewModelWidget<ThreadCardViewModel> {
  const ThreadChannelMain(this.userPost, {Key? key}) : super(key: key);

  final UserPost? userPost;

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
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('${userPost!.userImage}')),
                  )),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: CustomText(
                              text: '${userPost!.displayName}',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${userPost!.statusIcon}",
                            style: AppTextStyles.body2Medium,
                          ),
                          const SizedBox(width: 4),
                          CustomText(
                            text: '${userPost!.lastSeen}',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextParser(userPost!.message),
                    ],
                  ),
                  const SizedBox(height: 10),
                  userPost!.postSnapshotLinks!.isNotEmpty
                      ? SnapshotLinks(
                          postSnapshotLinks: userPost!.postSnapshotLinks)
                      : Container(),
                  const SizedBox(height: 10),
                  userPost!.postAudioFiles!.isNotEmpty
                      ? AudioMessage(postAudioFiles: userPost!.postAudioFiles)
                      : Container(),
                  const SizedBox(height: 10),
                  userPost!.postFiles!.isNotEmpty
                      ? PostFilesDisplay(postFiles: userPost!.postFiles)
                      : Container(),
                  const SizedBox(height: 10),
                  userPost!.postQuotedReplies!.isNotEmpty
                      ? QuotedReplies(
                          postQuotedReplies: userPost!.postQuotedReplies)
                      : Container(),
                  const SizedBox(height: 10),
                  userPost!.postMediaFiles!.isNotEmpty
                      ? MediaFiles(postMediaFiles: userPost!.postMediaFiles)
                      : Container(),
                  const SizedBox(height: 10),
                  userPost!.postEmojis!.isNotEmpty
                      ? EmojisList(userPost: userPost)
                      : Container(),
                  const SizedBox(height: 10),
                  userPost!.userThreadPosts!.isNotEmpty
                      ? PostReplies(userThreadPosts: userPost!.userThreadPosts)
                      : Container(),
                  const SizedBox(height: 15),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
