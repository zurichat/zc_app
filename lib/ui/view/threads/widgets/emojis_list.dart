import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/view/threads/threads_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'emojis.dart';

class EmojisList extends ViewModelWidget<ThreadsViewModel> {
  const EmojisList({
    Key? key,
    required this.userPost,
  }) : super(key: key);

  final UserPost? userPost;

  @override
  Widget build(BuildContext context, ThreadsViewModel model) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        for (PostEmojis postEmoji in userPost!.postEmojis!)
          Emojis(
            postEmoji,
            checkReact: () => model.checkReact(postEmoji.id),
          ),
        Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: IconButton(
              onPressed: () => model.addEmojis(userPost!.id),
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 14,
              ),
            )),
      ],
    );
  }
}
