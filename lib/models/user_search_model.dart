class NewUser {
  String? id;
  String? username;
  NewUser({this.id, this.username});

  factory NewUser.fromJson(Map<String, dynamic> json) => NewUser(
        id: json['_id'],
        username: json['user_name'],
      );
}

class UserSearch {
  String? id;
  String? bio;
  bool deleted;
  DateTime? deletedAt;
  String? displayName;
  String? email;
  dynamic files;
  String? firstName;
  String? imageUrl;
  DateTime? joinedAt;
  String? lastName;
  String? orgId;

  // ignore: todo
  //TODO Change back to normal type phone and presence and speak with backend
  String? phone;
  String? presence;
  String? pronouns;
  String? role;
  dynamic settings;
  dynamic socials;
  String? status;
  String? timeZone;
  String? userName;

  // TODO: Add isOnline to track online/offline status
  UserSearch({
    this.id,
    this.bio,
    this.deleted = false,
    this.deletedAt,
    this.displayName,
    this.email,
    this.files,
    this.firstName,
    this.imageUrl,
    this.joinedAt,
    this.lastName,
    this.orgId,
    this.phone,
    this.presence,
    this.pronouns,
    this.role,
    this.settings,
    this.socials,
    this.status,
    this.timeZone,
    this.userName,
  });

  factory UserSearch.fromJson(Map<String, dynamic> json) => UserSearch(
        id: json['_id'],
        bio: json['bio'],
        deleted: json['deleted'],
        deletedAt: DateTime.parse(json['deleted_at']),
        displayName: json['display_name'],
        email: json['email'],
        files: json['files'],
        firstName: json['first_name'],
        imageUrl: json['image_url'],
        joinedAt: DateTime.parse(json['joined_at']),
        lastName: json['last_name'],
        orgId: json['org_id'],
        phone: json['phone'],
        presence: json['presence'],
        pronouns: json['pronouns'],
        role: json['role'],
        settings: json['settings'],
        socials: json['socials'],
        status: json['status'],
        timeZone: json['time_zone'],
        userName: json['user_name'],
      );
}

class MainMembers {
  String? id;
  String? name;
  List<UserSearch>? data;

  MainMembers({
    this.id,
    this.name,
    this.data,
  });

  factory MainMembers.fromJson(Map<String, dynamic> json) => MainMembers(
        id: json['_id'],
        name: json['name'],
        data: json['data'].map((x) => UserSearch.fromJson(x)),
      );
}
