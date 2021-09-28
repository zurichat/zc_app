import 'dart:async';

import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../services/user_service.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/storage_keys.dart';
import '../api/http_api.dart';

class ChannelsApiService {
  final log = getLogger('ChannelsApiService');
  final _api = HttpApiService(channelsBaseUrl);

  final storageService = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();
  String currentChannelId = '';

  ///Call `onChange.sink.add` whenever you delete or create a channel to
  ///Add or Remove the channels from the home page
  StreamController<String> onChange = StreamController.broadcast();

  // Your functions for api calls can go in here
  // https://channels.zuri.chat/api/v1/61459d8e62688da5302acdb1/channels/

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
        onChange.sink.add('created channel');
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

  //Delete Channels
  // https://channels.zuri.chat/api/v1/{org_id}/channels/{channel_id}/
  Future<bool> deleteChannels() async {
    final orgId = _userService.currentOrgId;
    try {
      final res = await _api.delete(
        'v1/$orgId/channels/$currentChannelId/',
        headers: {'Authorization': 'Bearer $token'},
      );

      log.i(res?.data.toString());

      if (res?.statusCode == 204) {
        onChange.sink.add('channel deleted');
        return true;
      }
    } on Exception catch (e) {
      log.e(e.toString());
    }

    return false;
  }
}
