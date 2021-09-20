// import 'package:flutter/cupertino.dart';

class StaticUserModel {
  String userName;
  String userimg;
  String time;
  String joinInfo;
  bool online;

  StaticUserModel({
    required this.userName,
    required this.userimg,
    required this.joinInfo,
    required this.time,
    this.online = false,
  });
}
