import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_model.freezed.dart';

part 'app_model.g.dart';


@freezed
class ApiResponse with _$ApiResponse {
   factory ApiResponse({
     required  int? statusCode,
     required  String? statusMessage,
     required dynamic data,
   }) = _ApiResponse;


   factory ApiResponse.fromJson(Map<String, dynamic>json) =>_$ApiResponseFromJson(json);


}

@freezed
class ChannelMembersModel with _$ChannelMembersModel{
  factory ChannelMembersModel({
    required String? name,
    required bool? isAdmin,
  }) = _ChannelMembersModel;

  factory ChannelMembersModel.fromJson(Map<String, dynamic>json)=> _$ChannelMembersModelFromJson(json);
}

  @freezed
class ChannelModel with _$ChannelModel {
  factory ChannelModel({
    required int? id,
    required String? name,
  }) = _ChannelModel;

  factory ChannelModel.fromJson(Map<String, dynamic> json) => _$ChannelModelFromJson(json);
  }

@freezed
class ChannelsSearch with _$ChannelsSearch {
   factory ChannelsSearch({
    required int?id,
    required String?slug,
    required String?name,
  }) = _ChannelsSearch;

  factory ChannelsSearch.fromJson(Map<String, dynamic> json) => _$ChannelsSearchFromJson(json);

}

@freezed
class OrganizationModel with _$OrganizationModel {
   factory OrganizationModel({
    required int? id,
    required String? name,
    required String? organizationUrl,
    required String? time,
    required String? logoUrl,
    required bool? isOwner,
    required int? noOfMembers,
  }) = _OrganizationModel;

  factory OrganizationModel.fromJson(Map<String, dynamic> json) => _$OrganizationModelFromJson(json);

  }

@freezed
class ProfileModel with _$ProfileModel {
   factory ProfileModel({
    required bool? userId,
    required String? firstName,
    required String? lastName,
    required String? displayName,
    required String? email,
    required int? phoneNumber,
    required String? status,
    required String? bio,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json)  => _$ProfileModelFromJson(json);
  }

@freezed
class SignUpDataModel with _$SignUpDataModel{
  factory SignUpDataModel({
    required String?firstName,
    required String?lastName,
    required String?email,
    required String?password,
    required String?confirmPassword,
    required String?displayName,
    required String?phoneNumber,
  }) = _SignUpDataModel;

  factory SignUpDataModel.fromJson(Map<String, dynamic> json) => _$SignUpDataModelFromJson(json);


  }

@freezed
class StartDmModel with _$StartDmModel {
  factory StartDmModel({
    required int? id,
    required String? orgId,
    required bool? isOnline ,
    required String? imageUrl,
    required String? fullName,
    required String? files,
    required String? status,
    required String? email,
    required String? displayName,
    required String? bio,
    required String? pronouns,
    required String? phone,
    required String? timeZone,
    required String? joinedAt,
     required bool? isChecked
  }) = _StartDmModel;
  factory StartDmModel.fromJson(Map<String, dynamic>json) => StartDmModel.fromJson(json);
  }

@freezed
class StaticUserModel with _$StaticUserModel{
  factory StaticUserModel({
    required String? userName,
    required String? userImg,
    required String? joinInfo,
    required String? time,
   required bool? online,
  }) = _StaticUserModel;

  factory StaticUserModel.fromJson(Map<String, dynamic> json) => _$StaticUserModelFromJson(json);

  }


@freezed
class TodoModel with _$TodoModel {
  factory TodoModel({
    required int? userId,
    required int? id,
    required String? title,
    required bool?status,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);

  }

@freezed
class UserModel with _$UserModel {
  factory UserModel({
  required String?userId,
  required String?firstName,
  required String?lastName,
  required String?displayName,
  required String?email,
  required String?phoneNumber,
  required int?status,
  required String?timezone,
  required String?createdAt,
  required String?updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  }

@freezed
class UserThreadPost with _$UserThreadPost {

  factory UserThreadPost({
    required int? id,
  required String? userId,
    required String? image,
    required String? displayName,
    required String? statusIcon,
    required String? lastSeen,
    required String? message,
     List<PostEmojis>? postEmojis,
    required String? postDate,
  }) = _UserThreadPost;

  factory UserThreadPost.fromJson(Map<String, dynamic> json) => _$UserThreadPostFromJson(json);
  }


@freezed
class PostEmojis with _$PostEmojis{

  factory PostEmojis(
      {required int?id,
        required String?postEmoji,
        required int?postEmojiCount,
       required bool?hasReacted,}) = _PostEmojis;

  factory PostEmojis.fromJson(Map<String, dynamic> json) => _$PostEmojisFromJson(json);
  }

@freezed
class UserPost with _$UserPost{

  factory UserPost({
    required int? id,
    required String? userId,
    required String? displayName,
    required String? userImage,
    required String? message,
    required String? statusIcon,
    required String?lastSeen,
    List<PostEmojis>? postEmojis,
    List<UserThreadPost>? userThreadPosts,
    required String?channelName,
    required String?channelType,
    required String?postDate,
  }) = _UserPost;

  factory UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);
}

@freezed
class NewUser with _$NewUser {

  factory NewUser({required int? id, required String? username}) = _NewUser;

  factory NewUser.fromJson(Map<String, dynamic> json) => _$NewUserFromJson(json);
}

@freezed
class UserSearch with _$UserSearch {
  factory UserSearch({
    required int? id,
    required String? bio,
     required bool? deleted,
    required DateTime? deletedAt,
    required String? displayName,
    required String? email,
    required dynamic files,
    required String? firstName,
    required String? imageUrl,
    required String? joinedAt,
    required String? lastName,
    required String? orgId,
    required String? phone,
    required String? presence,
    required String? pronouns,
    required String? role,
    required String? settings,
    required dynamic socials,
    required String? status,
    required String? timeZone,
    required String? userName,
  }) = _UserSearch;

  factory UserSearch.fromJson(Map<String, dynamic> json) => _$UserSearchFromJson(json);
}

@freezed
class MainMembers with _$MainMembers{

  factory MainMembers({
    required int? id,
  required String? name,
    List<UserSearch>? data,
  }) = _MainMembeers;

  factory MainMembers.fromJson(Map<String, dynamic> json) => _$MainMembersFromJson(json);

}



