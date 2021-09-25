import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../general_widgets/custom_text.dart';
import '../../../../../models/user_post.dart';
import '../../../shared.dart';
import '../../../styles.dart';
import '../../text_parser/text_parser_view.dart';
import '../thread_card_viewmodel.dart';

class ThreadCardPost extends ViewModelWidget<ThreadCardViewModel> {
  const ThreadCardPost(this.userThreadPost, {Key? key}) : super(key: key);

  final UserThreadPost? userThreadPost;

  @override
  Widget build(BuildContext context, ThreadCardViewModel model) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: model.viewProfile,
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("${userThreadPost!.userImage}")),
                      )),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            fit: FlexFit.loose,
                            child: CustomText(
                              text: '${userThreadPost!.displayName}',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.looks_6,
                            color: AppColors.iconBlueColor,
                            size: 18,
                          ),
                          SizedBox(width: 2),
                          Text(
                            "${userThreadPost!.lastSeen}",
                            style: AppTextStyles.lastSeen,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextParser(userThreadPost!.message),
                      SizedBox(height: 10),

                      // Wrap(
                      //   spacing: 5,
                      //   runSpacing: 5,
                      //   children: [
                      //     for (Widget item in userThreadPost.postEmojis ?? [])
                      //       item
                      //   ],
                      // ),
                      // SizedBox(height: 15),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
