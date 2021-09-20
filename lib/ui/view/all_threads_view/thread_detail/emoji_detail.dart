import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/view/all_threads_view/thread_detail/thread_detail_viewmodel.dart';
import 'package:hng/ui/view/threads/widgets/emojis.dart';
import 'package:stacked/stacked.dart';

class EmojiDetailList extends ViewModelWidget<ThreadDetailViewmodel> {
  const EmojiDetailList({
    Key? key,
    required this.userPost,
  }) : super(key: key);

  final UserPost? userPost;

  @override
  Widget build(BuildContext context, ThreadDetailViewmodel model) {
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
                Icons.add_reaction_outlined,
                size: 14,
              ),
            )),
      ],
    );
  }
}
