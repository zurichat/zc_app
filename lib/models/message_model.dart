class MessageModel {
  String message;
  List<String>? media;

  MessageModel({required this.message, this.media});

  Map<String, dynamic> toJson() => {"content": message, "media": media};
}
