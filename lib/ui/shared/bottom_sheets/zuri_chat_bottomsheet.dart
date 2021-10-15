import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/styles.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:hng/utilities/utilities.dart';
import 'package:stacked_services/stacked_services.dart';

import 'thread_options_bottomsheet/widget/recent_emojis.dart';

Future<dynamic> zuriChatBottomSheet(
    {required BuildContext context,
    Function()? editMessage,
    Function()? markUnread,
    Function()? remindMe,
    var message,
    Function()? addToSavedItems,
    Function()? replyInThread,
    Function()? followThread,
    Function()? shareMessage,
    Function()? copyLinkToMessage,
    Function()? copyText,
    Function()? unPinFromConversation,
    Function()? turnQuestionToPoll}) {
  final _dialogService = locator<DialogService>();
  final _userService = locator<UserService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();

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
            _userService.userId ==
                    _storageService.getString(StorageKeys.currentUserId)
                ? ListTile(
                    title: Text("Edit message", style: AppTextStyles.heading9),
                    leading: const Icon(Icons.line_style_outlined),
                    onTap: editMessage,
                  )
                : Container(),
            ListTile(
              title: Text("Mark Unread", style: AppTextStyles.heading9),
              leading: const Icon(Icons.line_style_outlined),
              onTap: markUnread,
            ),
            ListTile(
              title: Text("Remind Me", style: AppTextStyles.heading9),
              leading: const Icon(Icons.timer_10_outlined),
              onTap: () async {
                await _dialogService.showCustomDialog(
                    variant: DialogType.remindMe);
              },
            ),
            ListTile(
              title: Text("Add to Saved Items", style: AppTextStyles.heading9),
              leading: const Icon(Icons.save_outlined),
              onTap: addToSavedItems,
            ),
            const Divider(),
            ListTile(
                title: Text("Reply in Thread", style: AppTextStyles.heading9),
                leading: const Icon(Icons.chat_rounded),
                onTap: replyInThread),
            ListTile(
                title: Text("Follow Thread", style: AppTextStyles.heading9),
                leading: const Icon(Icons.mark_chat_unread),
                onTap: followThread),
            const Divider(),
            ListTile(
                title: Text("Share Message", style: AppTextStyles.heading9),
                leading: const Icon(Icons.arrow_right_alt_rounded),
                onTap: shareMessage),
            ListTile(
                title:
                    Text("Copy Link to Message", style: AppTextStyles.heading9),
                leading: const Icon(Icons.link),
                onTap: copyLinkToMessage),
            ListTile(
                title: Text("Copy Text", style: AppTextStyles.heading9),
                leading: const Icon(Icons.copy),
                onTap: copyText),
            const Divider(),
            ListTile(
                title: Text("Unpin from Conversation",
                    style: AppTextStyles.heading9),
                onTap: unPinFromConversation,
                leading: const Icon(Icons.location_pin)),
            ListTile(
              title: Text("Turn question into poll",
                  style: AppTextStyles.heading9),
              leading: const Icon(Icons.bar_chart),
              onTap: turnQuestionToPoll,
              trailing: Text("Simple poll", style: AppTextStyles.subtitle),
            ),
            const Divider(),
          ],
        ),
      );
    },
  );
}
