import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../models/user_post.dart';
import '../thread_card_viewmodel.dart';
import 'emojis.dart';

class EmojisList extends ViewModelWidget<ThreadCardViewModel> {
  const EmojisList({
    Key? key,
    required this.userPost,
  }) : super(key: key);

  final UserPost? userPost;

  @override
  Widget build(BuildContext context, ThreadCardViewModel model) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        for (PostEmojis postEmoji in userPost!.postEmojis!)
          Emojis(
            postEmoji,
            checkReact: () => model.checkReact(userPost, postEmoji.id),
          ),
        Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: IconButton(
              onPressed: () => model.addEmojis(userPost!),
              icon: Icon(
                Icons.add_reaction_outlined,
                size: 14,
              ),
            )),
      ],
    );
  }
}
