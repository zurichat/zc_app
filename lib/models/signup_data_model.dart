import 'dart:convert';

class SignUpDataModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  String displayName;
  String phoneNumber;
  SignUpDataModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.displayName,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
    };
  }

  factory SignUpDataModel.fromMap(Map<String, dynamic> map) {
    return SignUpDataModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
      displayName: map['displayName'],
      phoneNumber: map['phoneNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpDataModel.fromJson(String source) =>
      SignUpDataModel.fromMap(json.decode(source));
}
