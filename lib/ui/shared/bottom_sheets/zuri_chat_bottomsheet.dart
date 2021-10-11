import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';

import 'thread_options_bottomsheet/widget/recent_emojis.dart';

Future<dynamic> zuriChatBottomSheet({
  required BuildContext context,
  Function()? onMarkUnread,
  Function()? onRemindMe,
  Function()? onAddToSavedItems,
  Function()? onReplyInThread,
  Function()? onFollowThread,
  Function()? onShareMessage,
  Function()? onCopyLinkToMessage,
  Function()? onCopyText,
  Function()? onChangePinnedState,
  Function()? onTurnQuestionToPoll,
  UserPost? post,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .75,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const RecentEmojis('😘'),
                const RecentEmojis('😳'),
                const RecentEmojis('😭'),
                const RecentEmojis('🤣'),
                const RecentEmojis('🤔'),
                const RecentEmojis('😏'),
                Container(
                  height: 50,
                  width: 50,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add_reaction_outlined,
                        size: 25,
                      )),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.greyBackgroundColor,
                  ),
                )
              ],
            ),
            const Divider(),
            ListTile(
              title: Text("Mark Unread", style: AppTextStyles.heading9),
              leading: const Icon(Icons.line_style_outlined),
              onTap: onMarkUnread,
            ),
            ListTile(
                title: Text("Remind Me", style: AppTextStyles.heading9),
                leading: const Icon(Icons.timer_10_outlined),
                onTap: onRemindMe),
            ListTile(
              title: Text("Add to Saved Items", style: AppTextStyles.heading9),
              leading: const Icon(Icons.save_outlined),
              onTap: onAddToSavedItems,
            ),
            const Divider(),
            ListTile(
                title: Text("Reply in Thread", style: AppTextStyles.heading9),
                leading: const Icon(Icons.chat_rounded),
                onTap: onReplyInThread),
            ListTile(
                title: Text("Follow Thread", style: AppTextStyles.heading9),
                leading: const Icon(Icons.mark_chat_unread),
                onTap: onFollowThread),
            const Divider(),
            ListTile(
                title: Text("Share Message", style: AppTextStyles.heading9),
                leading: const Icon(Icons.arrow_right_alt_rounded),
                onTap: onShareMessage),
            ListTile(
                title:
                    Text("Copy Link to Message", style: AppTextStyles.heading9),
                leading: const Icon(Icons.link),
                onTap: onCopyLinkToMessage),
            ListTile(
                title: Text("Copy Text", style: AppTextStyles.heading9),
                leading: const Icon(Icons.copy),
                onTap: onCopyText),
            const Divider(),
            ListTile(
                title: Text(
                    "${post?.pinned == true ? "Unpin from" : "Pin to"} Conversation",
                    style: AppTextStyles.heading9),
                leading: const Icon(Icons.push_pin),
                onTap: onChangePinnedState),
            ListTile(
              title: Text("Turn question into poll",
                  style: AppTextStyles.heading9),
              leading: const Icon(Icons.bar_chart),
              onTap: onTurnQuestionToPoll,
              trailing: Text("Simple poll", style: AppTextStyles.subtitle),
            ),
            const Divider(),
          ],
        ),
      );
    },
  );
}
