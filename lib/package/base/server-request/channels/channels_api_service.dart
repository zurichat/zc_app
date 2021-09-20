import 'dart:async';

import 'package:hng/app/app.logger.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';
import '../api/http_api.dart';

class ChannelsApiService {
  final log = getLogger('ChannelsApiService');
  final _api = HttpApiService(channelsBaseUrl);

  final storageService = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();

  ///Call `onChange.sink.add` whenever you delete or create a channel to
  ///Add or Remove the channels from the home page
  StreamController<String> onChange = StreamController.broadcast();

  // Your functions for api calls can go in here
  // https://channels.zuri.chat/api/v1/61459d8e62688da5302acdb1/channels/
  Future<List> getActiveDms() async {
    String userId = _userService.userId;
    String orgId = _userService.currentOrgId;

    List joinedChannels = [];

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

  Future<bool> createChannels({
    required String name,
    required String description,
    required bool private,
  }) async {
    String owner = _userService.userEmail;
    String orgId = _userService.currentOrgId;

    List joinedChannels = [];

    try {
      final res = await _api.post(
        'v1/$orgId/channels/',
        data: {
          "name": name,
          "owner": owner,
          "description": description,
          "private": private,
        },
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res?.statusCode == 200) {
        onChange.sink.add('created channel');
        return true;
      }

      log.i(joinedChannels);
    } on Exception catch (e) {
      log.e(e.toString());
    }

    return false;
  }

  dispose() {
    onChange.close();
  }

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);
}
