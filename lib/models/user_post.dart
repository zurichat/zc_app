import '../utilities/enums.dart';

class UserThreadPost {
  String? id;
  String? userId;
  String? displayName;
  String? userImage;
  String? statusIcon;

  String? moment;
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
    this.moment,
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
  String? moment;

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

  List<UserThreadPost>? userThreadPosts;

  bool pinned;

  UserPost({
    required this.id,
    required this.channelId,
    required this.displayName,
    required this.message,
    this.userId,
    this.userImage,
    this.statusIcon,
    this.moment,
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
    this.pinned = false,
  }) : super(
          id: id,
          displayName: displayName,
          message: message,
          statusIcon: statusIcon,
          moment: moment,
          postEmojis: postEmojis,
          channelId: channelId,
        );

  void addReply(UserThreadPost userThreadPost) {
    userThreadPosts!.add(userThreadPost);
  }
}
