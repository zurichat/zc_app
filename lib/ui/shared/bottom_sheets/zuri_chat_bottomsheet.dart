import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/utilities/constants/colors.dart';
import 'package:zurichat/utilities/constants/text_styles.dart';
import 'package:zurichat/utilities/internationalization/app_localization.dart';

Future<dynamic> zuriChatBottomSheet({
  required BuildContext context,
  Function()? markUnread,
  Function()? remindMe,
  Function()? addToSavedItems,
  Function()? replyInThread,
  Function()? followThread,
  Function()? shareMessage,
  Function()? copyLinkToMessage,
  Function()? deleteMessage,
  Function()? copyText,
  Function()? changePinnedState,
  Function()? turnQuestionToPoll,
  UserPost? post,
}) {
  final local = AppLocalization.of(context);
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
    builder: (context) {
      final bool dark = Theme.of(context).brightness == Brightness.dark;
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //TODO
            // const Expanded(child: RecentEmojis('😘')),
            // const Expanded(child: RecentEmojis('😳')),
            // const Expanded(child: RecentEmojis('😭')),
            // const Expanded(child: RecentEmojis('🤣')),
            // const Expanded(child: RecentEmojis('🤔')),
            // const Expanded(child: RecentEmojis('😏')),
            //     Expanded(
            //       child: Container(
            //         height: 50,
            //         width: 50,
            //         child: const Align(
            //             alignment: Alignment.center,
            //             child: Icon(
            //               Icons.add_reaction_outlined,
            //               size: 25,
            //             )),
            //         decoration: const BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: AppColors.greyBackgroundColor,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            // const Divider(),
            // ListTile(
            //   title: Text(
            //     MarkUnread,
            //     style: _dark
            // ? AppTextStyle.whiteSize16
            // : AppTextStyle.darkGreySize16,
            //   ),
            //   leading: SvgPicture.asset(
            //     Mark_Unread,
            //     color: _dark ? AppColors.whiteColor : AppColors.darkGreyColor,
            //     width: 18,
            //     height: 18,
            //   ),
            //   onTap: markUnread,
            // ),
            // ListTile(
            //   title: Text(
            //     RemindMe,
            //     style: _dark
            //         ? AppTextStyle.whiteSize16
            //         : AppTextStyle.darkGreySize16,
            //   ),
            //   leading: SvgPicture.asset(
            //     Remind_Me,
            //     color: _dark ? AppColors.whiteColor : AppColors.darkGreyColor,
            //     width: 18,
            //     height: 18,
            //   ),
            //   onTap: () async {
            //     await _dialogService.showCustomDialog();
            //   },
            // ),
            ListTile(
              title: Text(
                AddToSavedItems,
                style: dark
                    ? AppTextStyle.whiteSize16
                    : AppTextStyle.darkGreySize16,
              ),
              leading: SvgPicture.asset(
                Saved_Items,
                color: dark ? AppColors.whiteColor : AppColors.darkGreyColor,
                width: 18,
                height: 18,
              ),
              onTap: addToSavedItems,
            ),
            const Divider(),
            // ListTile(
            //     title: Text(
            //       ReplyInThreads,
            //       style: _dark
            // ? AppTextStyle.whiteSize16
            // : AppTextStyle.darkGreySize16,
            //     ),
            //     leading: SvgPicture.asset(
            //       Reply_In_Thread,
            //       color: _dark ? AppColors.whiteColor : AppColors.darkGreyColor,
            //       width: 18,
            //       height: 18,
            //     ),
            //     onTap: replyInThread),
            // ListTile(
            //     title: Text(
            //       FollowThreadZuriChatBottomSheet,
            //       style: _dark
            // ? AppTextStyle.whiteSize16
            // : AppTextStyle.darkGreySize16,
            //     ),
            //     leading: SvgPicture.asset(
            //       Follow_Thread,
            //       color: _dark ? AppColors.whiteColor : AppColors.darkGreyColor,
            //       width: 18,
            //       height: 18,
            //     ),
            //     onTap: followThread),
            // const Divider(),
            // ListTile(
            //     title: Text(
            //       ShareMessage,
            //       style: _dark
            //           ? AppTextStyle.whiteSize16
            //           : AppTextStyle.darkGreySize16,
            //     ),
            //     leading: SvgPicture.asset(
            //       Share_message,
            //       color: _dark ? AppColors.whiteColor : AppColors.darkGreyColor,
            //       width: 18,
            //       height: 18,
            //     ),
            //     onTap: shareMessage),
            ListTile(
                title: Text('Delete Message',
                    style: dark
                        ? AppTextStyle.whiteSize16
                        : AppTextStyle.darkGreySize16),
                leading: const Icon(Icons.delete),
                onTap: deleteMessage),
            // ListTile(
            //     title: Text(
            //       CopyLinkToMessage,
            //       style: _dark
            // ? AppTextStyle.whiteSize16
            // : AppTextStyle.darkGreySize16,
            //     ),
            //     leading: SvgPicture.asset(
            //       Copy_link_To_Message,
            //       color: _dark ? AppColors.whiteColor : AppColors.darkGreyColor,
            //       width: 18,
            //       height: 18,
            //     ),
            //     onTap: copyLinkToMessage),
            ListTile(
                title: Text(
                  CopyTextZuriChatBottomSheet,
                  style: dark
                      ? AppTextStyle.whiteSize16
                      : AppTextStyle.darkGreySize16,
                ),
                leading: SvgPicture.asset(
                  Copy_Text,
                  color: dark ? AppColors.whiteColor : AppColors.darkGreyColor,
                  width: 18,
                  height: 18,
                ),
                onTap: copyText),
            const Divider(),
            ListTile(
                title: Text(
                  "${post?.pinned == true ? local!.unPinFrom : local!.pinTo} ${local.conversation}",
                  style: dark
                      ? AppTextStyle.whiteSize16
                      : AppTextStyle.darkGreySize16,
                ),
                leading: SvgPicture.asset(
                  pinned_message,
                  color: dark ? AppColors.whiteColor : AppColors.darkGreyColor,
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
