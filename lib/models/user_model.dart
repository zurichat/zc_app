class UserModel {
  String? userId;
  String? firstName;
  String? lastName;
  String? displayName;
  String? email;
  String? phoneNumber;
  UserStatus? status;
  String? timezone;
  String? createdAt;
  String? updatedAt;

  UserModel({
    this.userId,
    this.firstName,
    this.lastName,
    this.displayName,
    this.email,
    this.phoneNumber,
    this.status,
    this.timezone,
    this.createdAt,
    this.updatedAt,
  });

  String? get fullName => '$firstName $lastName';

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'display_name': displayName,
      'email': email,
      'phone': phoneNumber,
      'status': status?.toMap(),
      'time_zone': timezone,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['_id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      displayName: map['display_name'],
      email: map['email'],
      phoneNumber: map['phone'],
      status: UserStatus.fromMap(map['status']),
      timezone: map['time_zone'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}

class UserStatus {
  String? text;
  String? tag;

  UserStatus({this.text, this.tag});

  factory UserStatus.fromMap(Map<String, dynamic> map) {
    return UserStatus(
      text: map['text'],
      tag: map['tag'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'tag': tag,
    };
  }
}
