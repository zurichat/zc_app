import 'dart:convert';

class NewChannel {
  String channelName;
  String owner;
  String channelDescription;

  bool private;

  NewChannel({
    required this.channelName,
    required this.owner,
    required this.channelDescription,
    required this.private,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': channelName,
      'owner': owner,
      'description': channelDescription,
      'private': private,
    };
  }

  factory NewChannel.fromMap(Map<String, dynamic> map) {
    return NewChannel(
      channelName: map['channelName'],
      owner: map['owner'],
      channelDescription: map['channelDescription'],
      private: map['private'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewChannel.fromJson(String source) =>
      NewChannel.fromMap(json.decode(source));
}
