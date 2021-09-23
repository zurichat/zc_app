import 'dart:developer';

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
  static String? currentUserId =
      storageService.getString(StorageKeys.currentUserId);
  final String allChannelsPath = '/api/v1/6145ad38285e4a18402073ad/channels/';
  final String joinedChannelsPath =
      '/api/v1/6145ad38285e4a18402073ad/channels/users/$currentUserId/';

  Map<String, dynamic> headers = {
    'Authorization':
        'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
  };

  /// Fetches a list of  all channels in that organization
  Future<List<ChannelsSearch>> allChannelsList() async {
    log.i(storageService.getString(StorageKeys.currentSessionToken));
    final response = await _channelsApi.get(allChannelsPath, headers: headers);
    return (response!.data?['data'] as List)
        .map((e) => ChannelsSearch.fromJson(e))
        .toList();
  }

  /// Fetches a list of channels that a user is, in that organization
  Future<List<ChannelsSearch>> joinedChannelsList() async {
    log.i(storageService.getString(StorageKeys.currentSessionToken));
    final response =
        await _channelsApi.get(joinedChannelsPath, headers: headers);
    return (response!.data?['data'] as List)
        .map((e) => ChannelsSearch.fromJson(e))
        .toList();
  }

  /// Fetches a list of members in that organization
  Future<List<UserSearch>> fetchListOfMembers() async {
    final response = await _dmApi
        .get('organizations/6145ad38285e4a18402073ad/members/', headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
    log.i("Org members length - ${response?.data?['data'].length}");
    log.i("Org members List ${response?.data?['data'].toString()}");
    return (response?.data?['data'])
        .map((e) => UserSearch.fromJson(e))
        .toList();
  }
}
