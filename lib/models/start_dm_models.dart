//User model
class UserModel {
  String? id;
  String? orgId;

  bool isOnline;
  String? imageUrl;
  String? files;
  String? fullName;
  String? status;
  String? email;
  String? displayName;
  String? bio;
  String? pronouns;
  String? phone;
  String? timeZone;
  String? joinedAt;
  bool isChecked;
  UserModel({
    this.id,
    this.orgId,
    this.isOnline = false,
    this.imageUrl,
    this.fullName,
    this.files,
    this.status,
    this.email,
    this.displayName,
    this.bio,
    this.pronouns,
    this.phone,
    this.timeZone,
    this.joinedAt,
    this.isChecked = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          fullName == other.fullName;

  @override
  int get hashCode => fullName.hashCode;

  @override
  String toString() {
    return fullName!;
  }

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "org_id": orgId,
      "presence": isOnline,
      "files": files,
      "image_url": imageUrl,
      "user_name": fullName,
      "status": status,
      "email": email,
      "display_name": displayName,
      "bio": bio,
      "pronouns": pronouns,
      "phone": phone,
      "time_zone": timeZone,
      "joined_at": joinedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"],
      orgId: json["org_id"],
      isOnline: json["presence"] == "true",
      // files: Files.fromJson(json["files"]),
      imageUrl: json["image_url"],
      fullName: json["user_name"] ,
      status: json["status"],
      email: json["email"],
      displayName: json["user_name"],
      bio: json["bio"],
      pronouns: json["pronouns"],
      phone: json["phone"],
      timeZone: json["time_zone"],
      joinedAt: json["joined_at"],
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}

//Channel model
class ChannelModel {}
