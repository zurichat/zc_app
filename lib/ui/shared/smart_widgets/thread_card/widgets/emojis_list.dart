import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:stacked/stacked.dart';

import '../thread_card_viewmodel.dart';
import 'emojis.dart';

class EmojisList extends ViewModelWidget<ThreadCardViewModel> {
  const EmojisList({
    Key? key,
    required this.userPost,
  }) : super(key: key);

  final UserPost? userPost;

  @override
  Widget build(BuildContext context, ThreadCardViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: [
          for (PostEmojis postEmoji in userPost!.postEmojis!)
            Emojis(
              postEmoji,
              checkReact: () => viewModel.checkReact(userPost, postEmoji.id),
            ),
          Container(
              height: 30,
              decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: IconButton(
                onPressed: () => viewModel.addEmojis(userPost!),
                icon: const Icon(
                  Icons.add_reaction_outlined,
                  size: 14,
                ),
              )),
        ],
      ),
    );
  }
}
