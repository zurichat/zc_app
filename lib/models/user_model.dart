class UserModel {
  String userName;
  String userimg;
  String time;
  String joinInfo;
  bool online;

  UserModel({
    required this.userName,
    required this.userimg,
    required this.joinInfo,
    required this.time,
    this.online = false,
  });
}
