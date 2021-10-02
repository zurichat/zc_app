import '../utilities/enums.dart';

class UserThreadPost {
  String? id;
  String? userId;
  String? displayName;
  String? userImage;
  String? statusIcon;

  String? lastSeen;
  String? message;
  List<dynamic>? postEmojis;
  String postDate;

  UserThreadPost({
    required this.id,
    this.userId,
    this.userImage,
    required this.displayName,
    this.statusIcon,
    this.lastSeen,
    required this.message,
    this.postEmojis,
    this.postDate = '',
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
  @override
  String? id;

  String? userID;

  @override
  String? userImage;

  @override
  String? displayName;

  @override
  String? statusIcon;

  @override
  String? lastSeen;

  @override
  String? message;

  @override
  List<dynamic>? postEmojis;
  String? channelName;
  ChannelType? channelType;

  String channelId;

  @override
  String postDate;

  List<UserThreadPost>? userThreadPosts;


  UserPost({
    required this.id,
    this.userID,
    required this.displayName,
    this.userImage,
    required this.message,
    this.statusIcon,
    this.lastSeen,
    this.postEmojis,
    this.userThreadPosts,
    this.channelName,
    this.channelType,
    this.postDate = "",
    required this.channelId,
  }) : super(
          id: id,
          displayName: displayName,
          message: message,
          statusIcon: statusIcon,
          lastSeen: lastSeen,
          postEmojis: postEmojis,
        );

  void addReply(UserThreadPost userThreadPost) {
    userThreadPosts!.add(userThreadPost);
  }
}
