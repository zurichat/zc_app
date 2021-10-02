import 'package:flutter/material.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
//Shows the original message with the number of replies
import '../../../../../general_widgets/custom_text.dart';
import '../../../../../models/user_post.dart';
import '../../../../../utilities/utilities.dart';
import '../../../shared.dart';
import '../../text_parser/text_parser_view.dart';
import '../thread_card_viewmodel.dart';
import 'emojis_list.dart';

class ThreadCardMain extends ViewModelWidget<ThreadCardViewModel> {
  const ThreadCardMain(this.userPost, {Key? key}) : super(key: key);

  final UserPost? userPost;

  @override
  Widget build(BuildContext context, ThreadCardViewModel viewModel) {
    return GestureDetector(
      onTap: () => viewModel.navigateToThread(userPost),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          Text(
                            "${userPost!.statusIcon}",
                            style: AppTextStyles.regular,
                          ),
                          const SizedBox(width: 2),
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
                  EmojisList(userPost: userPost),
                  const SizedBox(height: 15),
                  !nullListChecker(userPost!.userThreadPosts)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '$Show ${userPost!.userThreadPosts!.length} $moreReplies',
                            style: AppTextStyles.textButton1,
                          ),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
