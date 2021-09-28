import 'dart:async';
import 'dart:convert';
import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../services/user_service.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/storage_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../app/app.locator.dart';
import '../models/organization_model.dart';
import 'local_storage_services.dart';
import '../utilities/storage_keys.dart';
import '../ui/shared/colors.dart';
import '../utilities/constants.dart';
import '../utilities/failures.dart';

class ApisService {
  final Dio _dio = Dio();

  final _sharedPrefs = locator<SharedPreferenceLocalStorage>();

  final log = getLogger('DMApiService');
  //Todo: implement this in another service
  final _userApi = HttpApiService('https://api.zuri.chat/');

  final storageService = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();

  //All this are the current user details to be used
  String _currentOrgId = '';
  String _currentOrgUrl = '';
  String _currentOrgName = '';
  String _authToken = '';
  String _userId = '';
  String _userEmail = '';

  ///This will give you null because organization data has not been added
  OrganizationModel? organizationModel;

  // final log = getLogger('ChannelsApiService');
  final _api = HttpApiService(channelsBaseUrl);

  StreamController<String> controller = StreamController.broadcast();

  /// Fetches a list of organizations that exist in the zuri database
  /// This does not fetch the Organization the user belongs to
  /// To implement that use `getJoinedOrganizations()`
  Future<List<OrganizationModel>> fetchListOfOrganizations() async {
    final res = await _api.get(
      '/organizations',
      headers: {'Authorization': 'Bearer $token'},
    );
    log.i(res?.data?['data'].length);
    return (res?.data?['data'] as List)
        .map((e) => OrganizationModel.fromJson(e))
        .toList();
  }

  ///Get the list of Organization the user has joined
  Future<List<OrganizationModel>> getJoinedOrganizations() async {
    final email = _userService.userEmail;

    final res = await _api.get(
      '/users/$email/organizations',
      headers: {'Authorization': 'Bearer $token'},
    );
    log.i(res?.data?['data']);
    print(res?.data);
    if (res?.data['data'] == null) {
      return [];
    }
    return (res?.data?['data'] as List)
        .map((e) => OrganizationModel.fromJson(e))
        .toList();
  }

  /// Fetches information on a particular Organization. It takes a parameter
  /// `id` which is the id of the organization
  Future<OrganizationModel> fetchOrganizationInfo(String id) async {
    final res = await _api.get(
      '/organizations/$id',
      headers: {'Authorization': 'Bearer $token'},
    );
    return OrganizationModel.fromJson(res?.data?['data']);
  }

  /// takes in a `url` and returns a Organization that matches the url
  /// use this url for testing `zurichat-fsp1856.zurichat.com`
  Future<OrganizationModel> fetchOrganizationByUrl(String url) async {
    final res = await _api.get(
      '/organizations/url/$url',
      headers: {'Authorization': 'Bearer $token'},
    );
    log.i(res?.data);
    print(res?.data);

    res?.data?['data']['id'] = res.data['data']['_id'];
    return OrganizationModel.fromJson(res?.data?['data']);
  }

  ///Limited to the admin who created the org
  ///
  ///This should be used to add users to an organization by the admin user alone
  /// takes in a `Organization id` and joins the Organization
  Future<bool> joinOrganization(String orgId) async {
    final email = _userService.userEmail;

    final res = await _api.post(
      '/organizations/$orgId/members',
      data: {'user_email': email},
      headers: {'Authorization': 'Bearer $token'},
    );

    if (res?.statusCode == 200) {
      return true;
    }

    return false;
  }

  /// This method creates an organization. Creator email `email` must be present
  ///
  Future<String> createOrganization(String email) async {
    final res = await _api.post(
      '/organizations',
      headers: {'Authorization': 'Bearer $token'},
      data: {'creator_email': email},
    );
    return res?.data?['data']['InsertedID'];
  }

  /// Updates an organization's URL. The organization's id `orgId` must not be
  /// null or empty. Url must not begin with `https` or `http`
  Future<void> updateOrgUrl(String orgId, String url) async {
    final res = await _api.patch(
      '/organizations/$orgId/url',
      headers: {'Authorization': 'Bearer $token'},
      data: {'url': url},
    );
    return res?.data?['message'];
  }

  /// Updates an organization's name. The organization's id `orgId` must not be
  /// null or empty
  Future<void> updateOrgName(String orgId, String name) async {
    final res = await _api.patch(
      '/organizations/$orgId/name',
      headers: {'Authorization': 'Bearer $token'},
      data: {'organization_name': name},
    );
    return res?.data?['message'];
  }

  /// Updates an organization's logo. The organization's id `orgId` must not be
  /// null or empty
  Future<void> updateOrgLogo(String orgId, String url) async {
    final res = await _api.patch(
      '/organizations/$orgId/logo',
      headers: {'Authorization': 'Bearer $token'},
      data: {'url': url},
    );
    return res?.data?['message'];
  }

  Future<void> addMemberToOrganization(String orgId, String email) async {
    final res = await _api.post(
      '/organizations/$orgId/members',
      headers: {'Authorization': 'Bearer $token'},
      data: {'user_email': email},
    );
    return res?.data?['message'];
  }

  // Future<List> getActiveDms() async {
  //   // final userId = _userService.userId;
  //   // final orgId = _userService.currentOrgId;

  //   var joinedRooms = [];

  //   try {
  //     final res = await _api.get(
  //       /*'v1/sidebar?org=$orgId&user=$userId'*/
  //       'https://dm.zuri.chat/api/v1/sidebar?org=614679ee1a5607b13c00bcb7&user=6146ce37845b436ea04d102d',
  //       headers: {'Authorization': 'Bearer $token'},
  //     );
  //     joinedRooms = res?.data?['joined_rooms'];
  //     log.i(joinedRooms);
  //   } on Exception catch (e) {
  //     log.e(e.toString());
  //     return [];
  //   }

  //   return joinedRooms;
  // }

  //Todo: this method does not belong here
  Future<String?> getUser(ids) async {
    String id = ids[0];
    try {
      if (ids[0] == _userService.userId) {
        id = id[1];
      }
      final res = _userApi.get('users/$id');
      log.i(res);
    } on Exception catch (e) {
      log.e(e.toString());
      return null;
    }
  }

// Your functions for api calls can go in here
// https://channels.zuri.chat/api/v1/61459d8e62688da5302acdb1/channels/
  //TODo - fix
  // ignore: always_declare_return_types
  //TODO LATER
  Future<List> getActiveDms() async {
    final orgId = _userService.currentOrgId;

    var joinedChannels = [];

    try {
      final res = await _api.get(
        'v1/$orgId/channels/',
        headers: {'Authorization': 'Bearer $token'},
      );
      joinedChannels = res?.data ?? [];
      log.i(joinedChannels);
    } on Exception catch (e) {
      log.e(e.toString());
      return [];
    }

    return joinedChannels;
  }

  Future<String> getChannelSocketId(String channelId) async {
    final orgId = _userService.currentOrgId;

    var socketName = '';

    try {
      final res = await _api.get(
        'v1/$orgId/channels/$channelId/socket/',
        headers: {'Authorization': 'Bearer $token'},
      );
      socketName = res?.data['socket_name'] ?? '';
      log.i(socketName);
    } on Exception catch (e) {
      log.e(e.toString());
      return 'error';
    }

    return socketName;
  }

  Future<Map> joinChannel(String channelId) async {
    final userId = _userService.userId;
    final orgId = _userService.currentOrgId;

    // var channelMessages;

    try {
      final res =
          await _api.post('v1/$orgId/channels/$channelId/members/', headers: {
        'Authorization': 'Bearer $token'
      }, data: {
        '_id': userId,
        'is_admin': true,
      });

      log.i(res?.data);
      //  channelMessages = res?.data["data"] ?? [];

      //  log.i(channelMessages);
    } on Exception catch (e) {
      log.e(e.toString());
      return {};
    }

    return {};
  }

  Future<List> getChannelMessages(String channelId) async {
    // final userId = _userService.userId;
    final orgId = _userService.currentOrgId;

    List channelMessages;

    try {
      final res = await _api.get(
        'v1/$orgId/channels/$channelId/messages/',
        headers: {'Authorization': 'Bearer $token'},
      );
      channelMessages = res?.data['data'] ?? [];

      log.i(channelMessages);
    } on Exception catch (e) {
      log.e(e.toString());
      return [];
    }

    return channelMessages;
  }

  Future sendChannelMessages(
      String channelId, String userId, String message) async {
    final userId = _userService.userId;
    final orgId = _userService.currentOrgId;

    var channelMessage;

    try {
      final res = await _api.post('v1/$orgId/channels/$channelId/messages/',
          headers: {'Authorization': 'Bearer $token'},
          data: {'user_id': userId, 'content': message});

      channelMessage = res?.data['data'] ?? {};

      log.i(channelMessage);
    } on Exception catch (e) {
      log.e(e.toString());
      return [];
    }

    return channelMessage;
  }

  Future<List<ChannelModel>> fetchChannel() async {
    var channels = <ChannelModel>[];
    try {
      final res = await _api.get(
        '/v1/61459d8e62688da5302acdb1/channels/',
        //headers: {'Authorization': 'Bearer $token'},
      );
      channels =
          (res?.data as List).map((e) => ChannelModel.fromJson(e)).toList();
    } on Exception catch (e) {
      log.e('Channels EXception $e');
    } catch (e) {
      log.e(e);
    }

    return channels;
  }

  Future<bool> createChannels({
    required String name,
    required String description,
    required bool private,
  }) async {
    final owner = _userService.userEmail;
    final orgId = _userService.currentOrgId;

    try {
      final res = await _api.post(
        'v1/$orgId/channels/',
        data: {
          'name': name,
          'owner': owner,
          'description': description,
          'private': private,
        },
        headers: {'Authorization': 'Bearer $token'},
      );

      log.i(res?.data.toString());

      if (res?.statusCode == 201 || res?.statusCode == 200) {
        controller.sink.add('created channel');
        return true;
      }
    } on Exception catch (e) {
      log.e(e.toString());
    }

    return false;
  }

  getChannelPage(id) async {
    String orgId = _userService.currentOrgId;

    try {
      final response = await _api.get(
        '/v1/$orgId/channels/$id/',
        //headers: {'Authorization': 'Bearer $token'},
      );
      return ChannelModel.fromJson(response?.data);
    } on Exception catch (e) {
      log.e("Channels page Exception $e");
    } catch (e) {
      log.e(e);
    }
  }

  getChannelMembers(id) async {
    String orgId = _userService.currentOrgId;
    try {
      final res = await _api.get(
        '/v1/$orgId/channels/$id/members/',
        //headers: {'Authorization': 'Bearer $token'},
      );
      return (res?.data as List)
          .map((e) => ChannelMembermodel.fromJson(e))
          .toList();
    } on Exception catch (e) {
      log.e("Channels member EXception $e");
    } catch (e) {
      log.e(e);
    }
  }

  Future<void>? dispose() {
    controller.close();
  }

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  ///From the organization side bar set the current organissation Id
  ///and get it anywhere in the app using these getter
  String get currentOrgId {
    _currentOrgId = _sharedPrefs.getString(StorageKeys.currentOrgId) ?? '';
    //You can perform other function before returning
    return _currentOrgId;
  }

  String get currentOrgName {
    _currentOrgName = _sharedPrefs.getString(StorageKeys.currentOrgName) ?? '';
    //You can perform other function before returning
    return _currentOrgName;
  }

  String get currentOrgUrl {
    _currentOrgUrl = _sharedPrefs.getString(StorageKeys.currentOrgUrl) ?? '';
    //You can perform other function before returning
    return _currentOrgUrl;
  }

  void setOrganization() {
    // Todo implement Organization setter
  }

  ///From the organization side bar set the current organissation Id
  void setCurrentOrganizationId(String currentOrgId) {
    _currentOrgId = currentOrgId;
    _sharedPrefs.setString(StorageKeys.currentOrgId, _currentOrgId);
  }

  ///Get the token on app launch and to know if the user has
  ///formerly been loggen in. Show the home page instead of login view
  String get authToken {
    _authToken = _sharedPrefs.getString(StorageKeys.currentSessionToken) ?? '';
    //You can perform other function before returning
    return _authToken;
  }

  String get userId {
    _userId = _sharedPrefs.getString(StorageKeys.currentUserId) ?? '';
    //You can perform other function before returning
    return _userId;
  }

  String get userEmail {
    _userEmail = _sharedPrefs.getString(StorageKeys.currentUserEmail) ?? '';
    //You can perform other function before returning
    return _userEmail;
  }

  void setUserAndToken({
    required String? authToken,
    required String? userId,
    required String? userEmail,
  }) {
    //Todo: throw error for null parameters
    _authToken = authToken ?? '';
    _userId = userId ?? '';
    _userEmail = userEmail ?? '';

    _sharedPrefs.setString(StorageKeys.currentUserEmail, _userEmail);
    _sharedPrefs.setString(StorageKeys.currentSessionToken, _authToken);
    _sharedPrefs.setString(StorageKeys.currentUserId, _userId);
  }

  List<ThemeData> getThemes() {
    return [
      ThemeData.light().copyWith(
        primaryColor: AppColors.zuriPrimaryColor,
        appBarTheme: const AppBarTheme(
          color: AppColors.whiteColor,
          iconTheme: IconThemeData(color: AppColors.blackColor),
          textTheme: TextTheme(
            headline6: TextStyle(color: AppColors.blackColor, fontSize: 20.0),
          ),
          actionsIconTheme: IconThemeData(color: AppColors.blackColor),
        ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          backgroundColor: AppColors.zuriPrimaryColor,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.zuriPrimaryColor,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: AppColors.zuriPrimaryColor),
      ),
      ThemeData.light(),
      ThemeData.dark(),
      ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: AppColors.kimbieAccent,
          iconTheme: IconThemeData(color: AppColors.blackColor),
          textTheme: TextTheme(
            headline6: TextStyle(color: AppColors.blackColor, fontSize: 20.0),
          ),
        ),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData().copyWith(
          backgroundColor: AppColors.kimbieAccent,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.kimbieAccent,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: AppColors.kimbieAccent),
      ),
    ];
  }

  void sendGetRequest(endpoint) async {
    final response = await _dio.get(apiBaseUrl + endpoint);
    final result = jsonDecode(response.data);
    return result;
  }

  Future sendPostRequest(body, endpoint) async {
    try {
      final response = await _dio.post(
        apiBaseUrl + endpoint,
        data: json.encode(body),
      );

      final result = response.data;
      return result;
    } on DioError catch (e) {
      convertException(e);
    }
  }

//!Adjust the patch function as needed
  Future sendPatchRequest(body, endpoint, userId) async {
    try {
      final response =
          await _dio.patch(apiBaseUrl + endpoint, data: json.encode(body));
      final result = response.data;
      return result;
    } on DioError catch (e) {
      convertException(e);
    }
  }

  Failure convertException(DioError e) {
    if (e.type == DioErrorType.cancel)
      return InputFailure(errorMessage: e.message);
    else if (e.type == DioErrorType.connectTimeout)
      return NetworkFailure();
    else if (e.type == DioErrorType.receiveTimeout)
      return NetworkFailure();
    else if (e.type == DioErrorType.sendTimeout)
      return NetworkFailure();
    else if (e.type == DioErrorType.response)
      return ServerFailure(error: e.message);
    else if (e.type == DioErrorType.other)
      return UnknownFailure();
    else
      return UnknownFailure();
  }
}
