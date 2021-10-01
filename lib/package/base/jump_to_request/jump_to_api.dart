import 'package:dio/dio.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../models/channels_search_model.dart';
import '../../../models/user_search_model.dart';
import '../../../services/local_storage_services.dart';
import '../../../utilities/storage_keys.dart';

class JumpToApi {
  final log = getLogger('JumpToApi');
  final _channelsApi = ZuriApi('https://channels.zuri.chat/');
  final _dmApi = ZuriApi('https://api.zuri.chat/');
  static final storageService = locator<SharedPreferenceLocalStorage>();
  static String? get currentOrgId =>
      storageService.getString(StorageKeys.currentOrgId);
  static String? currentUserId =
      storageService.getString(StorageKeys.currentUserId);
  final String allChannelsPath = '/api/v1/$currentOrgId/channels/';
  final String joinedChannelsPath =
      '/api/v1/$currentOrgId/channels/users/$currentUserId/';
  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  Map<String, dynamic> headers = {
    'Authorization':
        'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
  };

  /// Fetches a list of  all channels in that organization
  Future<List<ChannelsSearch>> allChannelsList() async {
    try {
      final res = await _channelsApi.get(allChannelsPath, token: token);
      final channels = res?.data;
      return (channels)
          .map<ChannelsSearch>((e) => ChannelsSearch.fromJson(e))
          .toList();
    } on DioError catch (e) {
      log.e('API All channels error $e');
      return [];
    }
  }

  /// Fetches a list of channels that a user is, in that organization
  Future<List<ChannelsSearch>> joinedChannelsList() async {
    log.i(storageService.getString(StorageKeys.currentSessionToken));
    final res = await _channelsApi.get(joinedChannelsPath, token: token);
    return (res!.data?['data'] as List)
        .map((e) => ChannelsSearch.fromJson(e))
        .toList();
  }

  /// Fetches a list of members in that organization
  Future<List<UserSearch>> fetchListOfMembers() async {
    try {
      final res = await _dmApi.get('organizations/$currentOrgId/members/',
          token: token);
      log.i("Org members length - ${res?.data?['data'].length}");
      log.i("Org members List ${res?.data?['data'].toString()}");
      //  var meSearch = UserSearch.fromJson(res!.data['data']);
      return await res!.data['data']
          .map((e) => UserSearch.fromJson(e))
          .toList();
    } on DioError catch (e) {
      log.e('Error Watch - $e');
      return [];
    }
  }

  /// Fetches a list of members in that organization
  Future<List<NewUser>> fetchList() async {
    try {
      final res = await _dmApi.get('organizations/$currentOrgId/members/',
          token: token);
      final userList = res?.data['data'];
      return (userList as List).map((e) => NewUser.fromJson(e)).toList();
      // MainMembers mainMembers = MainMembers.fromJson(res!.data);
      // return mainMembers.data;
    } on DioError catch (e) {
      log.e('Error error $e');
    }
    return [];
  }
}
