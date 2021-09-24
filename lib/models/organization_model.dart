class OrganizationModel {
  final String? id;
  final String? name;
  final String? organizationUrl;
  final String? time;
  final String? logoUrl;
  final bool? isOwner;
  final int? noOfMembers;

  OrganizationModel({
    required this.id,
    required this.name,
    required this.organizationUrl,
    required this.time,
    required this.logoUrl,
    required this.isOwner,
    required this.noOfMembers,
  });

  factory OrganizationModel.fromJson(Map<String, dynamic> json) {
    return OrganizationModel(
        id: json['_id'] ?? json['id'],
        name: json['name'],
        logoUrl: json['logo_url'],
        time: json['created_at'],
        organizationUrl: json['organization_url'],
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

// List<OrganizationModel> dummyData = [
//   OrganizationModel(
//       name: 'ABTesters',
//       OrganizationUrl: 'abtesters.zuri.com',
//       time: '',
//       imageUrl: 'assets/images/Rectangle 138.png',
//       id: ''),
//   OrganizationModel(
//       name: 'HNGi9 ',
//       OrganizationUrl: 'hngi9.zuri.com ',
//       time: '',
//       imageUrl: 'assets/images/Rectangle 1922.png',
//       id: ''),
//   OrganizationModel(
//       name: 'DriveINC',
//       OrganizationUrl: 'driveinc.zuri.com',
//       time: '',
//       imageUrl: 'assets/images/Rectangle 1923.png',
//       id: ''),
//   OrganizationModel(
//       name: 'Remote',
//       OrganizationUrl: 'remote.zuri.com',
//       time: 'RE',
//       imageUrl: 'assets/images/Rectangle 1924.png',
//       id: ''),
//   OrganizationModel(
//       name: 'MyTeam',
//       OrganizationUrl: 'myteam.zuri.com',
//       time: 'MY',
//       imageUrl: 'assets/images/Rectangle 1925.png',
//       id: ''),
// ];
