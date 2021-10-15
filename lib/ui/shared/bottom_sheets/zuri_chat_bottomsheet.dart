import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/ui/shared/text_styles.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/internalization/localization/app_localization.dart';
import 'package:stacked_services/stacked_services.dart';

import 'thread_options_bottomsheet/widget/recent_emojis.dart';

Future<dynamic> zuriChatBottomSheet({
  required BuildContext context,
  Function()? markUnread,
  Function()? remindMe,
  Function()? addToSavedItems,
  Function()? replyInThread,
  Function()? followThread,
  Function()? shareMessage,
  Function()? copyLinkToMessage,
  Function()? copyText,
  Function()? changePinnedState,
  Function()? turnQuestionToPoll,
  UserPost? post,
}) {
  final local = AppLocalization.of(context);
  final _dialogService = locator<DialogService>();
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
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(child: RecentEmojis('😘')),
                const Expanded(child: RecentEmojis('😳')),
                const Expanded(child: RecentEmojis('😭')),
                const Expanded(child: RecentEmojis('🤣')),
                const Expanded(child: RecentEmojis('🤔')),
                const Expanded(child: RecentEmojis('😏')),
                Expanded(
                  child: Container(
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
                  ),
                )
              ],
            ),
            const Divider(),
            ListTile(
              title: Text(
                MarkUnread,
                style: AppTextStyle.darkGreySize16,
              ),
              leading: SvgPicture.asset(
                Mark_Unread,
                color: AppColors.darkGreyColor,
                width: 18,
                height: 18,
              ),
              onTap: markUnread,
            ),
            ListTile(
              title: Text(
                RemindMe,
                style: AppTextStyle.darkGreySize16,
              ),
              leading: SvgPicture.asset(
                Remind_Me,
                color: AppColors.darkGreyColor,
                width: 18,
                height: 18,
              ),
              onTap: () async {
                await _dialogService.showCustomDialog();
              },
            ),
            ListTile(
              title: Text(
                AddToSavedItems,
                style: AppTextStyle.darkGreySize16,
              ),
              leading: SvgPicture.asset(
                Saved_Items,
                color: AppColors.darkGreyColor,
                width: 18,
                height: 18,
              ),
              onTap: addToSavedItems,
            ),
            const Divider(),
            ListTile(
                title: Text(
                  ReplyInThreads,
                  style: AppTextStyle.darkGreySize16,
                ),
                leading: SvgPicture.asset(
                  Reply_In_Thread,
                  color: AppColors.darkGreyColor,
                  width: 18,
                  height: 18,
                ),
                onTap: replyInThread),
            ListTile(
                title: Text(
                  FollowThreadZuriChatBottomSheet,
                  style: AppTextStyle.darkGreySize16,
                ),
                leading: SvgPicture.asset(
                  Follow_Thread,
                  color: AppColors.darkGreyColor,
                  width: 18,
                  height: 18,
                ),
                onTap: followThread),
            const Divider(),
            ListTile(
                title: Text(
                  ShareMessage,
                  style: AppTextStyle.darkGreySize16,
                ),
                leading: SvgPicture.asset(
                  Share_message,
                  color: AppColors.darkGreyColor,
                  width: 18,
                  height: 18,
                ),
                onTap: shareMessage),
            ListTile(
                title: Text(
                  CopyLinkToMessage,
                  style: AppTextStyle.darkGreySize16,
                ),
                leading: SvgPicture.asset(
                  Copy_link_To_Message,
                  color: AppColors.darkGreyColor,
                  width: 18,
                  height: 18,
                ),
                onTap: copyLinkToMessage),
            ListTile(
                title: Text(
                  CopyTextZuriChatBottomSheet,
                  style: AppTextStyle.darkGreySize16,
                ),
                leading: SvgPicture.asset(
                  Copy_Text,
                  color: AppColors.darkGreyColor,
                  width: 18,
                  height: 18,
                ),
                onTap: copyText),
            const Divider(),
            ListTile(
                title: Text(
                  "${post?.pinned == true ? local!.unPinFrom : local!.pinTo} ${local.conversation}",
                  style: AppTextStyle.darkGreySize16,
                ),
                leading: SvgPicture.asset(
                  pinned_message,
                  color: AppColors.darkGreyColor,
                  width: 18,
                  height: 18,
                ),
                onTap: changePinnedState),
          ],
        ),
      );
    },
  );
}
