import 'package:flutter/material.dart';
import 'package:zurichat/models/user_post.dart';
import 'package:zurichat/ui/shared/styles.dart';
import 'package:stacked/stacked.dart';

import '../../../../../general_widgets/custom_text.dart';
import '../../../colors.dart';
import '../../text_parser/text_parser_view.dart';
import '../thread_card_viewmodel.dart';
import 'emojis_list.dart';

class ThreadCardDetail extends ViewModelWidget<ThreadCardViewModel> {
  const ThreadCardDetail(this.userPost, {Key? key}) : super(key: key);

  final UserPost? userPost;

  @override
  Widget build(BuildContext context, ThreadCardViewModel viewModel) {
    return Container(
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
