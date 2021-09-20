import 'dart:convert';

class UserModel {
  String? userId;
  String? firstName;
  String? lastName;
  String? displayName;
  String? email;
  String? phoneNumber;
  int? status;
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

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'display_name': displayName,
      'email': email,
      'phone': phoneNumber,
      'status': status,
      'time_zone': timezone,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      displayName: map['display_name'],
      email: map['email'],
      phoneNumber: map['phone'],
      status: map['status'],
      timezone: map['time_zone'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}
