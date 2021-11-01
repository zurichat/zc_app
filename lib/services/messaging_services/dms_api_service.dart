import 'package:zurichat/models/dm_model.dart';
import 'package:zurichat/utilities/api_handlers/zuri_api.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';

import '../../app/app.locator.dart';
import '../../app/app.logger.dart';
import '../app_services/local_storage_services.dart';
import '../in_review/user_service.dart';
import '../../ui/shared/shared.dart';

class DMApiService {
  final log = getLogger('DMApiService');
  //TODO Use correct endpoints
  final storageService = locator<SharedPreferenceLocalStorage>();
  static final _userService = locator<UserService>();
  final userId = _userService.userId;
  final _api = ZuriApi(dmsBaseUrl);
  final orgId = _userService.currentOrgId;
  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  Future<dynamic> getActiveDms() async {
    try {
      final res = await _api.get('v1/org/$orgId/users/$userId/rooms');
      log.i(res);
      return res;
    } on Exception catch (e) {
      log.e(e.toString());
      return null;
    }
  }

  Future<dynamic> getAllUsersInOrg() async {
    try {
      final res = await _api.get('v1/org/$orgId/members');

      return res;
    } on Exception catch (e) {
      log.e(e.toString());
      return null;
    }
  }

  Future<String> roomCreator(String friendId) async {
    final orgId = _userService.currentOrgId;
    final String memberID =
        storageService.getString(StorageKeys.idInOrganization).toString();
    String endpoint = '/v1/org/$orgId/users/$memberID/room';
    var body = {
      "org_id": orgId,
      "room_member_ids": [memberID, friendId],
      "room_name": "Prince"
    };
    try {
      final res = await _api.postDM(endpoint, body: body);
      return res.data['room_id'].toString();
    } on Exception catch (e) {
      log.e(e.toString());
      return 'error';
    }
  }

  Future sendDMs(String roomID, String memberID, String message) async {
    final orgId = _userService.currentOrgId;

    dynamic dmResult;

    try {
      String date = DateTime.now().toString();
      final res = await _api.postDM(
          "/v1/org/$orgId/rooms/$roomID/messages?date= $date",
          body: {'sender_id': memberID, 'message': message});

      dmResult = res.data['data'] ?? {};

      log.i(dmResult);
      return res.statusCode;
    } on Exception catch (e) {
      log.e(e.toString());
      return [];
    }
  }

  getDMSocketId(String channelId) {}

  Future<List<DmModel>> getRoomMessages(String roomID) async {
    final orgId = _userService.currentOrgId;
    List<DmModel> dmMessages = [];
    try {
      final res = await _api.getDM(roomID, orgId, token);
      List response = res?.data['results'] ?? [];
      response.forEach((element) {
        dmMessages.add(DmModel.fromJson(element));
      });
      log.i(dmMessages);
    } on Exception catch (e) {
      log.e(e.toString());
    }
    return dmMessages;
  }
}
