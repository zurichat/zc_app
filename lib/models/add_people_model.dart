
import 'dart:convert';

addPeopleToChannel addPeopleToChannelFromJson(String str) =>
    addPeopleToChannel.fromJson(json.decode(str));

class addPeopleToChannel {
  String? id;
  String? role_id;
  String? is_admin;

  addPeopleToChannel({
    this.id,
    this.role_id,
    this.is_admin,
  });

  factory addPeopleToChannel.fromJson(Map<String, dynamic> json) => addPeopleToChannel(
    id: json["_id"],
    role_id: json["role_id"],
    is_admin: json["is_admin"],
  );
}
