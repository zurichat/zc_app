import 'dart:async';

import 'package:hng/models/channel_members.dart';
import 'package:hng/models/channel_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../services/user_service.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/storage_keys.dart';

class ChannelsApiService {
  final log = getLogger('ChannelsApiService');
  final _api = ZuriApi(channelsBaseUrl);
  final storageService = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();

  StreamController<String> controller = StreamController.broadcast();

  // Your functions for api calls can go in here
  // https://channels.zuri.chat/api/v1/61459d8e62688da5302acdb1/channels/
  //TODo - fix
  // ignore: always_declare_return_types

  onChange() {}
  Future<List> getActiveDms() async {
    final orgId = _userService.currentOrgId;

    var joinedChannels = [];

    try {
      final res = await _api.get(
        'v1/$orgId/channels/',
        token: token,
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
        token: token,
      );
      socketName = res?.data['socket_name'] ?? '';
      log.i(socketName);
    } on Exception catch (e) {
      log.e(e.toString());
      return 'error';
    }

    return socketName;
  }

  Future<Map?> joinChannel(String channelId) async {
    await storageService.clearData(StorageKeys.currentChannelId);
    final userId = _userService.userId;
    final orgId = _userService.currentOrgId;

    // var channelMessages;

    try {
      final res = await _api
          .post('v1/$orgId/channels/$channelId/members/', token: token, body: {
        '_id': userId,
        'is_admin': true,
      });
      await storageService.setString(StorageKeys.currentChannelId, channelId);
      log.i(res?.data);
      //  channelMessages = res?.data["data"] ?? [];

      //  log.i(channelMessages);
      return res?.data ?? {};
    } on Exception catch (e) {
      log.e(e.toString());
      return {};
    }
  }

  Future<List> getChannelMessages(String channelId) async {
    // final userId = _userService.userId;
    final orgId = _userService.currentOrgId;

    List channelMessages;

    try {
      final res = await _api.get(
        'v1/$orgId/channels/$channelId/messages/',
        token: token,
      );
      channelMessages = res?.data ?? [];

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

    // ignore: prefer_typing_uninitialized_variables
    var channelMessage;

    try {
      final res = await _api.post('v1/$orgId/channels/$channelId/messages/',
          token: token, body: {'user_id': userId, 'content': message});

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
        //token: token,
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
        body: {
          'name': name,
          'owner': owner,
          'description': description,
          'private': private,
        },
        token: token,
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

  Future<bool> deleteChannel(String orgId, String channelId) async {
    try {
      final res = await _api.delete(
        '/v1/$orgId/channels/$channelId/',
        token: token,
      );
      // print("RES IS ${res?.statusCode}");
      if (res?.statusCode == 201 || res?.statusCode == 204) {
        controller.sink.add('Channel Deleted');
        return true;
      }
      return false;
    } catch (e) {
      log.e(e.toString());
      return false;
    }
  }

  getChannelPage(id) async {
    String orgId = _userService.currentOrgId;

    try {
      final response = await _api.get(
        '/v1/$orgId/channels/$id/',
        //token: token,
      );
      return ChannelModel.fromJson(response?.data);
    } on Exception catch (e) {
      log.e("Channels page Exception $e");
    } catch (e) {
      log.e(e);
    }
  }

  Future<List<ChannelMembermodel>?> getChannelMembers(id) async {
    String orgId = _userService.currentOrgId;
    try {
      final res = await _api.get(
        '/v1/$orgId/channels/$id/members/',
        //token: token,
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
}
