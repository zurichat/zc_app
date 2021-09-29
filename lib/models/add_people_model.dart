
import 'dart:convert';

AddPeopleToChannel addPeopleToChannelFromJson(String str) =>
    AddPeopleToChannel.fromJson(json.decode(str));

class AddPeopleToChannel {
  String? id;
  String? roleId;
  String? isAdmin;

  AddPeopleToChannel({
    this.id,
    this.roleId,
    this.isAdmin,
  });

  factory AddPeopleToChannel.fromJson(Map<String, dynamic> json) => AddPeopleToChannel(
    id: json["_id"],
    roleId: json["role_id"],
    isAdmin: json["is_admin"],
  );
}
