import 'package:dio/dio.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/models/channels_search_model.dart';
import 'package:hng/models/user_search_model.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';

class JumpToApi {
  final log = getLogger('JumpToApi');
  final _channelsApi = HttpApiService("https://channels.zuri.chat/");
  final _dmApi = HttpApiService("https://api.zuri.chat/");
  static final storageService = locator<SharedPreferenceLocalStorage>();
  static String? get currentOrgId =>
      storageService.getString(StorageKeys.currentOrgId);
  static String? currentUserId =
      storageService.getString(StorageKeys.currentUserId);
  final String allChannelsPath = '/api/v1/$currentOrgId/channels/';
  final String joinedChannelsPath =
      '/api/v1/$currentOrgId/channels/users/$currentUserId/';

  Map<String, dynamic> headers = {
    'Authorization':
        'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
  };

  /// Fetches a list of  all channels in that organization
  Future<List<ChannelsSearch>> allChannelsList() async {
    try {
      final res = await _channelsApi.get(allChannelsPath, headers: headers);
      final channels = res?.data;
      return (channels)
          .map<ChannelsSearch>((e) => ChannelsSearch.fromJson(e))
          .toList();
    } on DioError catch (e) {
      log.e("API All channels error $e");
      return [];
    }
  }

  /// Fetches a list of channels that a user is, in that organization
  Future<List<ChannelsSearch>> joinedChannelsList() async {
    log.i(storageService.getString(StorageKeys.currentSessionToken));
    final res = await _channelsApi.get(joinedChannelsPath, headers: headers);
    return (res!.data?['data'] as List)
        .map((e) => ChannelsSearch.fromJson(e))
        .toList();
  }

  /// Fetches a list of members in that organization
  Future<List<UserSearch>> fetchListOfMembers() async {
    try {
      final res =
          await _dmApi.get('organizations/$currentOrgId/members/', headers: {
        'Authorization':
            'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
      });
      log.i("Org members length - ${res?.data?['data'].length}");
      log.i("Org members List ${res?.data?['data'].toString()}");
      //  var meSearch = UserSearch.fromJson(res!.data['data']);
      return res!.data['data'].map((e) => UserSearch.fromJson(e)).toList();
    } on DioError catch (e) {
      log.e("Error Watch - $e");
      return [];
    }

    // return (res?.data?['data'])
    //     .map((e) => UserSearch.fromJson(e))
    //     .toList();
  }

  /// Fetches a list of members in that organization
  Future<List<NewUser>> fetchList() async {
    try {
      final res =
          await _dmApi.get('organizations/$currentOrgId/members/', headers: {
        'Authorization':
            'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
      });
      final userList = res?.data['data'];
      return (userList as List).map((e) => NewUser.fromJson(e)).toList();
      // MainMembers mainMembers = MainMembers.fromJson(res!.data);
      // return mainMembers.data;
    } on DioError catch (e) {
      print("Error error $e");
    }
    return [];
  }
}
