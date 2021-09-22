import 'package:flutter/material.dart';
import 'package:hng/general_widgets/custom_text.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'emojis_list.dart';

class ThreadCardMain extends ViewModelWidget<ThreadCardViewModel> {
  const ThreadCardMain(this.userPost, {Key? key}) : super(key: key);

  final UserPost? userPost;

  @override
  Widget build(BuildContext context, ThreadCardViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: model.viewProfile,
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("${userPost!.userImage}")),
                )),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: model.navigateToThread,
                  child: Column(
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
                          Icon(
                            userPost!.statusIcon,
                            color: Colors.blue,
                            size: 18,
                          ),
                          SizedBox(width: 2),
                          CustomText(
                            text: '${userPost!.lastSeen}',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      RichText(text: userPost!.message),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                EmojisList(userPost: userPost),
                SizedBox(height: 15)
              ],
            ),
          )
        ],
      ),
    );
  }
}
