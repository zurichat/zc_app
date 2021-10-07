import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hng/models/user_post.dart';

class MediaFiles extends StatelessWidget {
  const MediaFiles({Key? key, required this.postMediaFiles}) : super(key: key);
  final List<PostFiles>? postMediaFiles;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        for (PostFiles postMediaFile in postMediaFiles!)
          CachedNetworkImage(imageUrl: "${postMediaFile.srcLink}")
      ],
    );
  }
}
