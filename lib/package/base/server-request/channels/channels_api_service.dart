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

  List joinedChannels = [];
  Future<List> getActiveDms() async {
    final userId = _userService.userId;
    final orgId = _userService.currentOrgId;

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
        onChange.sink.add('created channel');
        return true;
      }
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

//Delete Channels
  Future<void> deleteChannels({
    required String name,
  }) async {
    final orgId = _userService.currentOrgId;
    try {
      final res = await _api.delete(
        'v1/$orgId/channels/',
        data: {
          'name': name,
        },
        headers: {'Authorization': 'Bearer $token'},
      );

      log.i(res?.data.toString());

      if (res?.statusCode == 204) {
      // joinedChannels.removeAt(token);
      }
    } on Exception catch (e) {
      log.e(e.toString());
    }
  }
}
