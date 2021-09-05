

class MemberModel {
  int id;
  String avatarUrl;
  String fullName;
  String displayName;
  String status;
  bool isOnline;

  MemberModel(
      {required this.id,
      required this.avatarUrl,
      required this.fullName,
      required this.displayName,
      required this.isOnline,
      required this.status});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'avatarUrl': avatarUrl,
  //     'fullName': fullName,
  //     'displayName': displayName,
  //     'isOnline': isOnline,
  //     'status': status,
  //   };
  // }

  // factory MemberModel.fromMap(Map<String, dynamic> map) {
  //   return MemberModel(
  //       id: map['id'],
  //       avatarUrl: map['avatarUrl'],
  //       fullName: map['fullName'],
  //       displayName: map['displayName'],
  //       isOnline: map['isOnline'],
  //       status: map['status']);
  // }

  // String toJson() => json.encode(toMap());
  // factory MemberModel.fromJson(String source) =>
  //     MemberModel.fromMap(json.decode(source));
}

