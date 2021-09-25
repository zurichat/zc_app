//The profile class of a user
//You could include other properties too
class ProfileModel {
  String? imageUrl;
  String? userId;
  String? firstName;
  String? lastName;
  String? displayName;
  String? email;
  String? phoneNumber;
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
    this.phoneNumber,
    this.status,
    this.bio,
    this.phoneNum,
  });
}
