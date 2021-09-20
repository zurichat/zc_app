class WorkspaceModel {
  final String? id;
  final String? name;
  final String? workSpaceUrl;
  final String? time;
  final String? logoUrl;
  final bool? isOwner;
  final int? noOfMembers;

  WorkspaceModel({
    required this.id,
    required this.name,
    required this.workSpaceUrl,
    required this.time,
    required this.logoUrl,
    required this.isOwner,
    required this.noOfMembers,
  });

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceModel(
        id: json['_id'],
        name: json['name'],
        logoUrl: json['logo_url'],
        time: json['created_at'],
        workSpaceUrl: json['workspace_url'],
        noOfMembers: json['no_of_members'],
        isOwner: json['isOwner']);
  }

  String get initials {
    return this
        .name!
        .split(' ')
        .map((e) => e.split('').first.toUpperCase())
        .join();
  }
}

// List<WorkspaceModel> dummyData = [
//   WorkspaceModel(
//       name: 'ABTesters',
//       workSpaceUrl: 'abtesters.zuri.com',
//       time: '',
//       imageUrl: 'assets/images/Rectangle 138.png',
//       id: ''),
//   WorkspaceModel(
//       name: 'HNGi9 ',
//       workSpaceUrl: 'hngi9.zuri.com ',
//       time: '',
//       imageUrl: 'assets/images/Rectangle 1922.png',
//       id: ''),
//   WorkspaceModel(
//       name: 'DriveINC',
//       workSpaceUrl: 'driveinc.zuri.com',
//       time: '',
//       imageUrl: 'assets/images/Rectangle 1923.png',
//       id: ''),
//   WorkspaceModel(
//       name: 'Remote',
//       workSpaceUrl: 'remote.zuri.com',
//       time: 'RE',
//       imageUrl: 'assets/images/Rectangle 1924.png',
//       id: ''),
//   WorkspaceModel(
//       name: 'MyTeam',
//       workSpaceUrl: 'myteam.zuri.com',
//       time: 'MY',
//       imageUrl: 'assets/images/Rectangle 1925.png',
//       id: ''),
// ];
