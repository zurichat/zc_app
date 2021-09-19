import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng/ui/view/threads/widgets/emojis.dart';

enum ChannelType { private, public, personal }

class UserThreadPost {
  int? id;
  String? displayName;
  String? userImage;
  IconData? statusIcon;
  String? lastSeen;
  TextSpan message;
  List<Widget>? postEmojis;

  UserThreadPost({
    required this.id,
    this.userImage,
    required this.displayName,
    this.statusIcon,
    this.lastSeen,
    required this.message,
    this.postEmojis,
  });

  void addReaction() {
    postEmojis!.add(Emojis(
      emoji: Icons.emoji_emotions,
      number: 2,
    ));
  }
}

class PostEmojis {
  IconData? postEmoji;
  int? postEmojiCount;
  bool? selected;

  PostEmojis(postEmoji, postEmojiCount, selected);
}

class UserPost extends UserThreadPost {
  int? id;
  String? userImage;
  String? displayName;
  IconData? statusIcon;
  String? lastSeen;
  TextSpan message;
  List<Widget>? postEmojis;
  String? channelName;
  ChannelType? channelType;

  List<UserThreadPost>? userThreadPosts;

  UserPost({
    required this.id,
    required this.displayName,
    this.userImage,
    required this.message,
    this.statusIcon,
    this.lastSeen,
    this.postEmojis,
    this.userThreadPosts,
    this.channelName,
    this.channelType,
  }) : super(
          id: id,
          displayName: displayName,
          message: message,
          statusIcon: statusIcon,
          lastSeen: lastSeen,
          postEmojis: postEmojis,
        );
}
