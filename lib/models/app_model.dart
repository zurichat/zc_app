import 'dart:convert';
import 'package:hng/models/user_post.dart';
import 'package:hng/ui/view/channel/channel_members/channel_members_list_model.dart';

import '../utilities/enums.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_model.freezed.dart';

part 'app_model.g.dart';


@freezed
class ApiResponse with _$ApiResponse {

   factory ApiResponse({
     required  int? statusCode,
     required  String? statusMessage,
     required dynamic? data,
   }) = _ApiResponse;


   factory ApiResponse.fromJson(Map<String, dynamic>json)=>_$ApiResponseFromJson(json);
   Map<String, dynamic> toJson() {
     var map = <String, dynamic>{};
     map['status_code'] = statusCode;
     map['status_message'] = statusMessage;
     map['data'] = data;
     return map;
   }

}

@freezed
class ChannelMembersModel with _$ChannelMembersModel{
  factory ChannelMembersModel({
    required String? name,
    required bool? isAdmin,
  }) = _ChannelMembersModel;

  factory ChannelMembersModel.fromJson(Map<String, dynamic>json)=> _$ChannelMembersModelFromJson(json);
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['is_admin'] = isAdmin;
    return map;
  }
}

  @freezed
class ChannelModel with _$ChannelModel {
  factory ChannelModel({
    required int? id,
    required String? name,
  }) = _ChannelModel;

  factory ChannelModel.fromJson(Map<String, dynamic> json) => _$ChannelModelFromJson(json);
    Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
  }

@freezed
class ChannelsSearch with _$ChannelsSearch {
   factory ChannelsSearch({
    required int?id,
    required String?slug,
    required String?name,
  }) = _ChannelsSearch;

  factory ChannelsSearch.fromJson(Map<String, dynamic> json) => _$ChannelsSearchFromJson(json);
   Map<String, dynamic> toJson() {
     var map = <String, dynamic>{};
     map['id'] = id;
     map['slug'] = slug;
     map['name'] = name;
     return map;
   }

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
   Map<String, dynamic> toJson() {
     var map = <String, dynamic>{};
     map['id'] = id;
     map['name'] = name;
     map['logoUrl'] = logoUrl;
     map['created_at'] = time;
     map['workspace_url'] = organizationUrl;
     map['no_of_members'] = noOfMembers;
     map['isOwner'] = isOwner;

     return map;
   }
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
   Map<String, dynamic> toJson() {
     var map = <String, dynamic>{};
     map['_userId'] = userId;
     map['first_name'] = firstName;
     map['last_name'] = lastName;
     map['display_name'] = displayName;
     map['email'] = email;
     map['phone_number'] = phoneNumber;
     map['status'] = status;
     map['bio'] = bio;

     return map;}
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


  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['org_id'] = orgId;
    map['online'] = isOnline;
    map['image_url'] = imageUrl;
    map['full_name'] = fullName;
    map['files'] = files;
    map['status'] = status;
    map['email'] = email;
    map['display_name'] = displayName;
    map['bio'] = bio;
    map['pronouns'] = pronouns;
    map['phone'] = phone;
    map['time_zone'] = timeZone;
    map['join_at'] = joinedAt;
    map['isChecked'] = isChecked;

    return map;
  }
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

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['user_name'] = userName;
    map['user_image'] = userImg;
    map['join_info'] = joinInfo;
    map['time'] = time;
    map['online'] = online;

    return map;
  }
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


  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['status'] = status;
    return map;
  }

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

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['userId'] = userId;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['display_name'] = displayName;
    map['email'] = email;
    map['phone_number'] = phoneNumber;
    map['status'] = status;
     map['time_zon'] = timezone;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;

    return map;
  }

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
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['user_image'] = image;
    map['display_name'] = displayName;
    map['status_icon'] = statusIcon;
    map['last_seen'] = lastSeen;
    map['message'] = message;
     map['post_emoji'] = postEmojis;
    map['post_date'] = postDate;

    return map;
  }

  }


@freezed
class PostEmojis with _$PostEmojis{

  factory PostEmojis(
      {required int?id,
        required String?postEmoji,
        required int?postEmojiCount,
       required bool?hasReacted,}) = _PostEmojis;

  factory PostEmojis.fromJson(Map<String, dynamic> json) => _$PostEmojisFromJson(json);
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['post_pmoji'] = postEmoji;
    map['post_emoji_count'] = postEmojiCount;
    map['has_reacted'] = hasReacted;
    return map;
  }

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
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['display_name'] = displayName;
    map['user_image'] = userImage;
    map['message'] = message;
    map['status_icon'] = statusIcon;
    map['last_seen'] = lastSeen;
    map['post_emoji'] = postEmojis;
    map['user_thread_posts'] = userThreadPosts;
    map['channel_name'] = channelName;
    map['channel_type'] = channelType;
    map['post_date'] = postDate;

    return map;
  }
}

@freezed
class NewUser with _$NewUser {

  factory NewUser({required int? id, required String? username}) = _NewUser;

  factory NewUser.fromJson(Map<String, dynamic> json) => _$NewUserFromJson(json);
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['user_name'] = username;

    return map;
  }

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
    required dynamic? files,
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
    required dynamic? socials,
    required String? status,
    required String? timeZone,
    required String? userName,
  }) = _UserSearch;

  factory UserSearch.fromJson(Map<String, dynamic> json) => UserSearch.fromJson(json);
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['bio'] = bio;
    map['deleted'] = deleted;
    map['deleted_at'] = deletedAt;
    map['display_name'] = displayName;
    map['email'] = email;
    map['files'] = files;
    map['first_name'] = firstName;
    map['image_url'] = imageUrl;
    map['joined_at'] = joinedAt;
    map['last_name'] = lastName;
    map['org_id'] = orgId;
    map['phone'] = phone;
    map['presence'] = presence;
    map['pronouns'] = pronouns;
    map['role'] = role;
    map['settings'] = settings;
    map['socials'] = socials;
    map['status'] = status;
    map['time_zone'] = timeZone;
    map['user_name'] = userName;

    return map;
  }
}

@freezed
class MainMembers with _$MainMembers{

  factory MainMembers({
    required int? id,
  required String? name,
    List<UserSearch>? data,
  }) = _MainMembeers;

  factory MainMembers.fromJson(Map<String, dynamic> json) => MainMembers.fromJson(json);

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['data'] = data;
    return map;
  }
}



