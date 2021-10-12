import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/bottom_sheets/zuri_chat_bottomsheet.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:stacked/stacked.dart';

import '../../../../../general_widgets/custom_text.dart';
import '../../../colors.dart';
import '../../text_parser/text_parser_view.dart';
import '../thread_card_viewmodel.dart';
import 'emojis_list.dart';
import 'package:hng/app/app.logger.dart';

class ThreadCardDetail extends ViewModelWidget<ThreadCardViewModel> {
  ThreadCardDetail(this.userPost, {Key? key}) : super(key: key);

  final UserPost? userPost;
      final log = getLogger("ThreadCardDetail");

  @override
  Widget build(BuildContext context, ThreadCardViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: viewModel.viewProfile,
             onLongPress: () => zuriChatBottomSheet(
                context: context,
                addToSavedItems: () {
                  viewModel.saveItem(
                      channelID: userPost!.channelId,
                      channelName: userPost!.channelName,
                      displayName: userPost!.displayName,
                      message: userPost!.message,
                      lastSeen: userPost!.lastSeen,
                      messageID: userPost!.id,
                      userID: userPost!.userId,
                      userImage: userPost!.userImage);
                  log.i("Saved");
                  viewModel.goBack();
                  showSimpleNotification(
                    const Text("Added successfully"),
                    position: NotificationPosition.top,
                    background: AppColors.appBarGreen,
                    trailing: const Icon(Icons.mark_chat_read_outlined),
                    duration: const Duration(seconds: 3),
                  );
                }),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
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
                              Text(
                                "${userPost!.statusIcon}",
                                style: AppTextStyles.regular,
                              ),
                              const SizedBox(width: 2),
                              Padding(
                                padding: const EdgeInsets.only(right: 18),
                                child: CustomText(
                                  text: '${userPost!.lastSeen}',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.bookmark_outline,
                              size: 18,
                              color: AppColors.greyishColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextParser(userPost!.message),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                EmojisList(userPost: userPost),
                const SizedBox(height: 15)
              ],
            ),
          )
        ],
      ),
    );
  }
}
