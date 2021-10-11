import "package:simple_moment/simple_moment.dart";

class PinnedMessage {
  String? displayName;
  String? channelId;
  String? content;
  String? moment;
  String? id;

  PinnedMessage(
      {this.displayName, this.channelId, this.content, this.moment, this.id});

  Map<String, dynamic> toJson() => {
        'display_name': displayName,
        'channel_id': channelId,
        'content': content,
        'moment': moment,
        'id': id,
      };

  factory PinnedMessage.fromJson(Map<String, dynamic> json) => PinnedMessage(
        moment: Moment.now().from(DateTime.parse(json['timestamp'])),
        channelId: json['channel_id'],
        displayName: json['user_id'],
        content: json['content'],
        id: json['_id'],
      );

  @override
  String toString() => content!;
}
