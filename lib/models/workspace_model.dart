class WorkspaceModel {
  final String id;
  final String name;
  final String? workSpaceUrl;
  final String? time;
  final String? imageUrl;
  final String? plugins;
  final String? settings;

  WorkspaceModel({
    required this.id,
    required this.name,
    required this.workSpaceUrl,
    required this.time,
    required this.imageUrl,
    this.plugins,
    this.settings,
  });

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceModel(
      id: json['_id'],
      name: json['name'],
      imageUrl: json['image_url'],
      time: json['created_at'],
      workSpaceUrl: json['url'],
      plugins: json['plugins'],
      settings: json['settings'],
    );
  }

  String get initials {
    return this
        .name
        .split(' ')
        .map((e) => e.split('').first.toUpperCase())
        .join();
  }
}

List<WorkspaceModel> dummyData = [
  WorkspaceModel(
      name: "ABTesters",
      workSpaceUrl: "abtesters.zuri.com",
      time: "",
      imageUrl: "assets/images/Rectangle 138.png",
      id: ''),
  WorkspaceModel(
      name: "HNGi9 ",
      workSpaceUrl: "hngi9.zuri.com ",
      time: "",
      imageUrl: "assets/images/Rectangle 1922.png",
      id: ''),
  WorkspaceModel(
      name: "DriveINC",
      workSpaceUrl: "driveinc.zuri.com",
      time: "",
      imageUrl: "assets/images/Rectangle 1923.png",
      id: ''),
  WorkspaceModel(
      name: "Remote",
      workSpaceUrl: "remote.zuri.com",
      time: "RE",
      imageUrl: "assets/images/Rectangle 1924.png",
      id: ''),
  WorkspaceModel(
      name: "MyTeam",
      workSpaceUrl: "myteam.zuri.com",
      time: "MY",
      imageUrl: "assets/images/Rectangle 1925.png",
      id: ''),
];
