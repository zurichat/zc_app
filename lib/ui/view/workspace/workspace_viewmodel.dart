
// import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';


class WorkspaceViewModel extends BaseViewModel {}

class WorkspaceModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  WorkspaceModel(
      {required this.name,
        required this.message,
        required this.time,
        required this.avatarUrl});
}

List<WorkspaceModel>  dummyData = [
  WorkspaceModel(
      name: "ABTesters",
      message: "abtesters.zuri.com",
      time: "",
      avatarUrl: "assets/Rectangle 138.png"),
  WorkspaceModel(
      name: "HNGi9 ",
      message: "hngi9.zuri.com ",
      time: "",
      avatarUrl: "assets/Rectangle 1922.png"),
  WorkspaceModel(
      name: "DriveINC",
      message: "driveinc.zuri.com",
      time: "",
      avatarUrl: "assets/Rectangle 1923.png"),
  WorkspaceModel(
      name: "Remote",
      message: "remote.zuri.com",
      time: "RE",
      avatarUrl: "assets/Rectangle 1924.png"),
  WorkspaceModel(
      name: "MyTeam",
      message: "myteam.zuri.com",
      time: "MY",
      avatarUrl: "assets/Rectangle 1925.png"),
];




