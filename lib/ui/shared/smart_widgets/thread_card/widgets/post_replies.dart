import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/shared/smart_widgets/thread_card/thread_card_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PostReplies extends ViewModelWidget<ThreadCardViewModel> {
  const PostReplies({
    Key? key,
    required this.userPost,
  }) : super(key: key);

  final UserPost? userPost;
  @override
  Widget build(BuildContext context, ThreadCardViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: userPost!.userThreadPosts!.length > 4
                  ? 4
                  : userPost!.userThreadPosts!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 25,
                    width: 25,
                    imageUrl: "${userPost!.userThreadPosts![0].userImage}"),
              ),
            ),
          ),
          TextButton(
              onPressed: () => viewModel.navigateToThread(userPost),
              child: Text(
                  "${userPost!.userThreadPosts!.length} ${userPost!.userThreadPosts!.length > 1 ? 'Replies' : 'Reply'}"))
        ],
      ),
    );
  }
}
