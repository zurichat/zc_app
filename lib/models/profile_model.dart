//The profile class of a user
//You could include other properties too
class ProfileModel {
  String? imageUrl;
  String? userId;
  String? firstName;
  String? lastName;
  String? displayName;
  String? email;
  String? status;
  String? bio;
  String? phoneNum;
  ProfileModel({
    this.imageUrl,
    this.userId,
    this.firstName,
    this.lastName,
    this.displayName,
    this.email,
    this.status,
    this.bio,
    this.phoneNum,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['first_name'],
      email: json['email'],
      displayName: json['display_name'],
      status: json['bio'],
      imageUrl: json['image_url'],
      phoneNum: json['phone'],
    );
  }
}
