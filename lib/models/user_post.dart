import '../utilities/enums.dart';

class UserThreadPost {
  String? id;
  String? userId;
  String? displayName;
  String? userImage;
  String? statusIcon;

  String? lastSeen;
  String? message;
  List<PostEmojis>? postEmojis;
  String postDate;
  String? channelName;
  ChannelType? channelType;

  String channelId;

  List<PostFiles>? postFiles;
  List<PostFiles>? postMediaFiles;
  List<PostFiles>? postAudioFiles;
  List<UserThreadPost>? postQuotedReplies;
  List<PostSnapshotLinks>? postSnapshotLinks;

  UserThreadPost({
    required this.id,
    this.userId,
    required this.channelId,
    this.channelName,
    this.channelType,
    this.userImage,
    required this.displayName,
    this.statusIcon,
    this.lastSeen,
    required this.message,
    this.postEmojis,
    this.postDate = '',
    this.postFiles = const <PostFiles>[],
    this.postMediaFiles = const <PostFiles>[],
    this.postAudioFiles = const <PostFiles>[],
    this.postQuotedReplies = const <UserThreadPost>[],
    this.postSnapshotLinks = const <PostSnapshotLinks>[],
  });

  void addReaction(PostEmojis postEmoji) {
    postEmojis!.add(postEmoji);
  }
}

class PostSnapshotLinks {
  String? srcLink;
  String? logo;
  String? title;
  String? linkTitleText;
  String? siteDescription;
  String? siteImageLink;

  PostSnapshotLinks({
    required this.srcLink,
    required this.logo,
    required this.title,
    required this.linkTitleText,
    required this.siteDescription,
    required this.siteImageLink,
  });
}

class PostFiles {
  String? id;
  String? srcLink;
  PostFileType type;
  String? size;
  String? fileName;

  PostFiles({
    required this.id,
    required this.srcLink,
    required this.type,
    required this.size,
    required this.fileName,
  });
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

  @override
  String? userId;

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
  List<PostEmojis>? postEmojis;

  @override
  String? channelName;
  @override
  ChannelType? channelType;

  @override
  String channelId;

  @override
  String postDate;

  List<UserThreadPost>? userThreadPosts;
  @override
  List<PostFiles>? postFiles;

  @override
  List<PostFiles>? postMediaFiles;

  @override
  List<PostFiles>? postAudioFiles;

  @override
  List<UserThreadPost>? postQuotedReplies;

  @override
  List<PostSnapshotLinks>? postSnapshotLinks;

  UserPost({
    required this.id,
    this.userId,
    required this.displayName,
    this.userImage,
    required this.message,
    this.statusIcon,
    this.lastSeen,
    this.postEmojis,
    this.userThreadPosts = const <UserThreadPost>[],
    this.channelName,
    this.channelType,
    this.postDate = "",
    this.postFiles = const <PostFiles>[],
    this.postMediaFiles = const <PostFiles>[],
    this.postAudioFiles = const <PostFiles>[],
    this.postQuotedReplies = const <UserThreadPost>[],
    this.postSnapshotLinks = const <PostSnapshotLinks>[],
    required this.channelId,
  }) : super(
          id: id,
          displayName: displayName,
          message: message,
          statusIcon: statusIcon,
          lastSeen: lastSeen,
          postEmojis: postEmojis,
          channelId: channelId,
        );

  void addReply(UserThreadPost userThreadPost) {
    userThreadPosts!.add(userThreadPost);
  }
}
