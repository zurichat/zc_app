import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zurichat/models/user_post.dart';

class MediaFiles extends StatelessWidget {
  const MediaFiles({Key? key, required this.postMediaFiles}) : super(key: key);
  final List<PostFiles>? postMediaFiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: [
          for (PostFiles postMediaFile in postMediaFiles!)
            InkWell(
                onTap: () {},
                child: CachedNetworkImage(imageUrl: "${postMediaFile.srcLink}"))
        ],
      ),
    );
  }
}
