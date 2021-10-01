class ChannelMemberModel {
  String? id, roleId;
  bool isAdmin;

  ChannelMemberModel({
    required this.id,
    required this.isAdmin,
    this.roleId,
  });

  factory ChannelMemberModel.fromJson(Map<String, dynamic> json) {
    return ChannelMemberModel(
        id: json['_id'], isAdmin: json['is_admin'], roleId: json['role_id']);
  }

  String toString() {
    return '_id: $id, is_admin: $isAdmin, role_id: $roleId';
  }
}
