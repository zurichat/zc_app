import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';

class ThreadsApiService {
  final log = getLogger('ThreadsApiService');
  final _apiService = ZuriApi(channelsBaseUrl);
  final _userService = locator<UserService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();


  Future<List> getThreadMessages(String messageId) async {
    final orgId = _userService.currentOrgId;

    List threadMessages = [];
    String threadMessagesEndpoint = "v1/$orgId/messages/$messageId/threads/";

    try {
      final response =
          await _apiService.get(threadMessagesEndpoint, token: token);
      threadMessages = response?.data ?? [];
      log.i(threadMessages);
    } catch (e) {
      log.e(e.toString());
    }
    return threadMessages;
  }

  Future sendThreadMessage(
      {required String messageId, required String message, required String channelId}) async {
    final userId = _userService.userId;
    final orgId = _userService.currentOrgId;

    String threadMessagesEndpoint = "v1/$orgId/messages/$messageId/threads/?channel_id=$channelId";
    var threadMessage = {};

    try {
      final response = await _apiService.post(threadMessagesEndpoint,
          body: {"user_id": userId, "content": message}, token: token);
      threadMessage = response?.data ?? {};
      log.i(threadMessage);
    }
    catch (e) {
      log.e(e.toString());
    }
    return threadMessage;
  }

  String? get token {
    return _storageService.getString(StorageKeys.currentSessionToken);
  }
}
