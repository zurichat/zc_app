class ThreadReplies {
  String senderName;
  String message;
  String time;
  String imageUrl;
   static List<ThreadReplies> _threadReplies=[];

  ThreadReplies(
      {required this.senderName,
      required this.message,
      required this.time,
      required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'senderName': senderName,
      'message': message,
      'time': time,
      'imaheUrl': imageUrl,
    };
  }

  ThreadReplies fromMap(Map<String, dynamic> map) {
    return ThreadReplies(
        senderName: map['senderName'],
        message: map['message'],
        time: map['time'],
        imageUrl: map['imageUrl']);
  }

  static List<ThreadReplies> replies() {
    List<ThreadReplies> replies = [
      ThreadReplies(
          senderName: 'mark',
          message: 'I think you cans ask on help channel',
          time: "20:23",
          imageUrl: "assets/images/user.png"),
      ThreadReplies(
          senderName: 'princess',
          message: 'Co Ask',
          time: "20:23",
          imageUrl: "assets/images/user.png"),
      ThreadReplies(
          senderName: 'paule32',
          message: 'I am also interested',
          time: "20:23",
          imageUrl: "assets/images/user.png"),
      ThreadReplies(
          senderName: 'FreshFish',
          message: 'What track are you?',
          time: "20:23",
          imageUrl: "assets/images/user.png"),
      ThreadReplies(
          senderName: 'Sticklo',
          message: 'I am also interested',
          time: "20:23",
          imageUrl: "assets/images/user.png"),
      ThreadReplies(
          senderName: 'EunicePops',
          message: 'Abdul is his slack name',
          time: "20:23",
          imageUrl: "assets/images/user.png"),
    ];
    _threadReplies.addAll(replies);
    return _threadReplies;
  }

   static void addReply(ThreadReplies reply){
  _threadReplies.add(reply);
  }
}
