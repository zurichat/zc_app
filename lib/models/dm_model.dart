//DM model. Contains all the properties returned by a message
class DmModel {
  String? messageID;
  String? createdAt;
  List? media;
  String? message;
  bool? isPinned;
  List? reactions;
  bool? isRead;
  List? replies;
  String? roomID;
  List? savedBy;
  String? senderID;
  bool? isSentFromThread;
  List? threads;
  DmModel({
    required this.messageID,
    required this.createdAt,
    this.media,
    required this.message,
    this.isPinned,
    this.reactions,
    this.isRead,
    this.replies,
    required this.roomID,
    this.savedBy,
    required this.senderID,
    this.isSentFromThread,
    this.threads,
  });
  factory DmModel.fromJson(Map<String, dynamic> json) {
    return DmModel(
      messageID: json["_id"],
      createdAt: json["created_at"],
      media: json["media"],
      message: json["message"],
      isPinned: json["pinned"],
      reactions: json["reactions"],
      isRead: json["read"],
      replies: json["replied_message"],
      roomID: json["room_id"],
      savedBy: json["saved_by"],
      senderID: json["sender_id"],
      isSentFromThread: json["sent_from_thread"],
      threads: json["threads"],
    );
  }
}
