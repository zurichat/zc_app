// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddPeopleToChannel _$_$_AddPeopleToChannelFromJson(
    Map<String, dynamic> json) {
  return _$_AddPeopleToChannel(
    id: json['id'] as String?,
    roleId: json['roleId'] as String?,
    isAdmin: json['isAdmin'] as String?,
  );
}

Map<String, dynamic> _$_$_AddPeopleToChannelToJson(
        _$_AddPeopleToChannel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roleId': instance.roleId,
      'isAdmin': instance.isAdmin,
    };

_$_ApiResponse _$_$_ApiResponseFromJson(Map<String, dynamic> json) {
  return _$_ApiResponse(
    statusCode: json['statusCode'] as int?,
    statusMessage: json['statusMessage'] as String?,
    data: json['data'],
  );
}

Map<String, dynamic> _$_$_ApiResponseToJson(_$_ApiResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'data': instance.data,
    };

_$_ChannelMembersModel _$_$_ChannelMembersModelFromJson(
    Map<String, dynamic> json) {
  return _$_ChannelMembersModel(
    name: json['name'] as String?,
    isAdmin: json['isAdmin'] as bool?,
  );
}

Map<String, dynamic> _$_$_ChannelMembersModelToJson(
        _$_ChannelMembersModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isAdmin': instance.isAdmin,
    };

_$_ChannelModel _$_$_ChannelModelFromJson(Map<String, dynamic> json) {
  return _$_ChannelModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$_$_ChannelModelToJson(_$_ChannelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_ChannelsSearch _$_$_ChannelsSearchFromJson(Map<String, dynamic> json) {
  return _$_ChannelsSearch(
    id: json['id'] as int?,
    slug: json['slug'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$_$_ChannelsSearchToJson(_$_ChannelsSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
    };

_$_OrganizationModel _$_$_OrganizationModelFromJson(Map<String, dynamic> json) {
  return _$_OrganizationModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    organizationUrl: json['organizationUrl'] as String?,
    time: json['time'] as String?,
    logoUrl: json['logoUrl'] as String?,
    isOwner: json['isOwner'] as bool?,
    noOfMembers: json['noOfMembers'] as int?,
  );
}

Map<String, dynamic> _$_$_OrganizationModelToJson(
        _$_OrganizationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'organizationUrl': instance.organizationUrl,
      'time': instance.time,
      'logoUrl': instance.logoUrl,
      'isOwner': instance.isOwner,
      'noOfMembers': instance.noOfMembers,
    };

_$_ProfileModel _$_$_ProfileModelFromJson(Map<String, dynamic> json) {
  return _$_ProfileModel(
    userId: json['userId'] as bool?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    displayName: json['displayName'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as int?,
    status: json['status'] as String?,
    bio: json['bio'] as String?,
  );
}

Map<String, dynamic> _$_$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'status': instance.status,
      'bio': instance.bio,
    };

_$_SignUpDataModel _$_$_SignUpDataModelFromJson(Map<String, dynamic> json) {
  return _$_SignUpDataModel(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    confirmPassword: json['confirmPassword'] as String?,
    displayName: json['displayName'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );
}

Map<String, dynamic> _$_$_SignUpDataModelToJson(_$_SignUpDataModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'displayName': instance.displayName,
      'phoneNumber': instance.phoneNumber,
    };

_$_StartDmModel _$_$_StartDmModelFromJson(Map<String, dynamic> json) {
  return _$_StartDmModel(
    id: json['id'] as int?,
    orgId: json['orgId'] as String?,
    isOnline: json['isOnline'] as bool?,
    imageUrl: json['imageUrl'] as String?,
    fullName: json['fullName'] as String?,
    files: json['files'] as String?,
    status: json['status'] as String?,
    email: json['email'] as String?,
    displayName: json['displayName'] as String?,
    bio: json['bio'] as String?,
    pronouns: json['pronouns'] as String?,
    phone: json['phone'] as String?,
    timeZone: json['timeZone'] as String?,
    joinedAt: json['joinedAt'] as String?,
    isChecked: json['isChecked'] as bool?,
  );
}

Map<String, dynamic> _$_$_StartDmModelToJson(_$_StartDmModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orgId': instance.orgId,
      'isOnline': instance.isOnline,
      'imageUrl': instance.imageUrl,
      'fullName': instance.fullName,
      'files': instance.files,
      'status': instance.status,
      'email': instance.email,
      'displayName': instance.displayName,
      'bio': instance.bio,
      'pronouns': instance.pronouns,
      'phone': instance.phone,
      'timeZone': instance.timeZone,
      'joinedAt': instance.joinedAt,
      'isChecked': instance.isChecked,
    };

_$_StaticUserModel _$_$_StaticUserModelFromJson(Map<String, dynamic> json) {
  return _$_StaticUserModel(
    userName: json['userName'] as String?,
    userImg: json['userImg'] as String?,
    joinInfo: json['joinInfo'] as String?,
    time: json['time'] as String?,
    online: json['online'] as bool?,
  );
}

Map<String, dynamic> _$_$_StaticUserModelToJson(_$_StaticUserModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userImg': instance.userImg,
      'joinInfo': instance.joinInfo,
      'time': instance.time,
      'online': instance.online,
    };

_$_TodoModel _$_$_TodoModelFromJson(Map<String, dynamic> json) {
  return _$_TodoModel(
    userId: json['userId'] as int?,
    id: json['id'] as int?,
    title: json['title'] as String?,
    status: json['status'] as bool?,
  );
}

Map<String, dynamic> _$_$_TodoModelToJson(_$_TodoModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'status': instance.status,
    };

_$_UserModel _$_$_UserModelFromJson(Map<String, dynamic> json) {
  return _$_UserModel(
    userId: json['userId'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    displayName: json['displayName'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    status: json['status'] as int?,
    timezone: json['timezone'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
}

Map<String, dynamic> _$_$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'status': instance.status,
      'timezone': instance.timezone,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$_UserThreadPost _$_$_UserThreadPostFromJson(Map<String, dynamic> json) {
  return _$_UserThreadPost(
    id: json['id'] as int?,
    userId: json['userId'] as String?,
    image: json['image'] as String?,
    displayName: json['displayName'] as String?,
    statusIcon: json['statusIcon'] as String?,
    lastSeen: json['lastSeen'] as String?,
    message: json['message'] as String?,
    postEmojis: (json['postEmojis'] as List<dynamic>?)
        ?.map((e) => PostEmojis.fromJson(e as Map<String, dynamic>))
        .toList(),
    postDate: json['postDate'] as String?,
  );
}

Map<String, dynamic> _$_$_UserThreadPostToJson(_$_UserThreadPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'image': instance.image,
      'displayName': instance.displayName,
      'statusIcon': instance.statusIcon,
      'lastSeen': instance.lastSeen,
      'message': instance.message,
      'postEmojis': instance.postEmojis,
      'postDate': instance.postDate,
    };

_$_PostEmojis _$_$_PostEmojisFromJson(Map<String, dynamic> json) {
  return _$_PostEmojis(
    id: json['id'] as int?,
    postEmoji: json['postEmoji'] as String?,
    postEmojiCount: json['postEmojiCount'] as int?,
    hasReacted: json['hasReacted'] as bool?,
  );
}

Map<String, dynamic> _$_$_PostEmojisToJson(_$_PostEmojis instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postEmoji': instance.postEmoji,
      'postEmojiCount': instance.postEmojiCount,
      'hasReacted': instance.hasReacted,
    };

_$_UserPost _$_$_UserPostFromJson(Map<String, dynamic> json) {
  return _$_UserPost(
    id: json['id'] as int?,
    userId: json['userId'] as String?,
    displayName: json['displayName'] as String?,
    userImage: json['userImage'] as String?,
    message: json['message'] as String?,
    statusIcon: json['statusIcon'] as String?,
    lastSeen: json['lastSeen'] as String?,
    postEmojis: (json['postEmojis'] as List<dynamic>?)
        ?.map((e) => PostEmojis.fromJson(e as Map<String, dynamic>))
        .toList(),
    userThreadPosts: (json['userThreadPosts'] as List<dynamic>?)
        ?.map((e) => UserThreadPost.fromJson(e as Map<String, dynamic>))
        .toList(),
    channelName: json['channelName'] as String?,
    channelType: json['channelType'] as String?,
    postDate: json['postDate'] as String?,
  );
}

Map<String, dynamic> _$_$_UserPostToJson(_$_UserPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'displayName': instance.displayName,
      'userImage': instance.userImage,
      'message': instance.message,
      'statusIcon': instance.statusIcon,
      'lastSeen': instance.lastSeen,
      'postEmojis': instance.postEmojis,
      'userThreadPosts': instance.userThreadPosts,
      'channelName': instance.channelName,
      'channelType': instance.channelType,
      'postDate': instance.postDate,
    };

_$_NewUser _$_$_NewUserFromJson(Map<String, dynamic> json) {
  return _$_NewUser(
    id: json['id'] as int?,
    username: json['username'] as String?,
  );
}

Map<String, dynamic> _$_$_NewUserToJson(_$_NewUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
    };

_$_UserSearch _$_$_UserSearchFromJson(Map<String, dynamic> json) {
  return _$_UserSearch(
    id: json['id'] as int?,
    bio: json['bio'] as String?,
    deleted: json['deleted'] as bool?,
    deletedAt: json['deletedAt'] == null
        ? null
        : DateTime.parse(json['deletedAt'] as String),
    displayName: json['displayName'] as String?,
    email: json['email'] as String?,
    files: json['files'],
    firstName: json['firstName'] as String?,
    imageUrl: json['imageUrl'] as String?,
    joinedAt: json['joinedAt'] as String?,
    lastName: json['lastName'] as String?,
    orgId: json['orgId'] as String?,
    phone: json['phone'] as String?,
    presence: json['presence'] as String?,
    pronouns: json['pronouns'] as String?,
    role: json['role'] as String?,
    settings: json['settings'] as String?,
    socials: json['socials'],
    status: json['status'] as String?,
    timeZone: json['timeZone'] as String?,
    userName: json['userName'] as String?,
  );
}

Map<String, dynamic> _$_$_UserSearchToJson(_$_UserSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bio': instance.bio,
      'deleted': instance.deleted,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'displayName': instance.displayName,
      'email': instance.email,
      'files': instance.files,
      'firstName': instance.firstName,
      'imageUrl': instance.imageUrl,
      'joinedAt': instance.joinedAt,
      'lastName': instance.lastName,
      'orgId': instance.orgId,
      'phone': instance.phone,
      'presence': instance.presence,
      'pronouns': instance.pronouns,
      'role': instance.role,
      'settings': instance.settings,
      'socials': instance.socials,
      'status': instance.status,
      'timeZone': instance.timeZone,
      'userName': instance.userName,
    };

_$_MainMembeers _$_$_MainMembeersFromJson(Map<String, dynamic> json) {
  return _$_MainMembeers(
    id: json['id'] as int?,
    name: json['name'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => UserSearch.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_MainMembeersToJson(_$_MainMembeers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'data': instance.data,
    };
