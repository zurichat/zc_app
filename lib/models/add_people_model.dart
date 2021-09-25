
import 'dart:convert';

AddPeopleToChannel AddPeopleToChannelFromJson(String str) =>
    AddPeopleToChannel.fromJson(json.decode(str));

class AddPeopleToChannel {
  String? id;
  String? role_id;
  String? is_admin;

  AddPeopleToChannel({
    this.id,
    this.role_id,
    this.is_admin,
  });

  factory AddPeopleToChannel.fromJson(Map<String, dynamic> json) => AddPeopleToChannel(
    id: json["_id"],
    role_id: json["role_id"],
    is_admin: json["is_admin"],
  );
}
