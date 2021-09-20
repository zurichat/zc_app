import 'package:flutter/material.dart';
import 'package:hng/utilities/enums.dart';

class UserThreadPost {
  int? id;
  String? displayName;
  String? userImage;
  IconData? statusIcon;
  String? lastSeen;
  TextSpan message;
  List<PostEmojis>? postEmojis;

  UserThreadPost({
    required this.id,
    this.userImage,
    required this.displayName,
    this.statusIcon,
    this.lastSeen,
    required this.message,
    this.postEmojis,
  });

  void addReaction(PostEmojis postEmoji) {
    postEmojis!.add(postEmoji);
  }
}

class PostEmojis {
  int? id;
  String? postEmoji;
  int postEmojiCount;
  bool hasReacted;

  PostEmojis(
      {required this.id,
      this.postEmoji,
      this.postEmojiCount = 1,
      this.hasReacted = true});
}

class UserPost extends UserThreadPost {
  int? id;
  String? userImage;
  String? displayName;
  IconData? statusIcon;
  String? lastSeen;
  TextSpan message;
  List<PostEmojis>? postEmojis;
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
