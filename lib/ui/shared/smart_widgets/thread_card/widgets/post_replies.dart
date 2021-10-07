import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';

class PostReplies extends StatelessWidget {
  const PostReplies({
    Key? key,
    required this.userThreadPosts,
  }) : super(key: key);

  final List<UserThreadPost>? userThreadPosts;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /*Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                userThreadPosts!.length > 4 ? 4 : userThreadPosts!.length,
            itemBuilder: (context, index) => */
        CachedNetworkImage(
            height: 20,
            width: 20,
            imageUrl: "${userThreadPosts![0].userImage}"),
        //   ),
        // ),

        TextButton(
            onPressed: () {},
            child: Text(
                "${userThreadPosts!.length} ${userThreadPosts!.length > 1 ? 'Replies' : 'Reply'}"))
      ],
    );
  }
}
