import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/utilities/storage_keys.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../services/user_service.dart';
import '../../../../ui/shared/shared.dart';

class DMApiService {
  final log = getLogger('DMApiService');
  //Todo: implement this in another service

  final storageService = locator<SharedPreferenceLocalStorage>();
  static final _userService = locator<UserService>();
  final userId = _userService.userId;
    final _userApi = ZuriApi(coreBaseUrl);
  final orgId = _userService.currentOrgId;
  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

   Future<List> getActiveDms() async {
    // final userId = _userService.userId;
    // final orgId = _userService.currentOrgId;

    var joinedRooms = [];

    try {
      final res = await _userApi.get(
        /*'v1/sidebar?org=$orgId&user=$userId'*/
        'https://dm.zuri.chat/api/v1/sidebar?org=614679ee1a5607b13c00bcb7&user=6146ce37845b436ea04d102d',
        token: token,
      );
      joinedRooms = res?.data?['joined_rooms'];
      log.i(joinedRooms);
    } on Exception catch (e) {
      log.e(e.toString());
      return [];
    }

    return joinedRooms;
  }

  //Todo: this method does not belong here
  Future<String?> getUser(ids) async {
    String id = ids[0];
    try {
      if (ids[0] == _userService.userId) {
        id = id[1];
      }
      final res = _userApi.get('users/$id', token: token);
      log.i(res);
    } on Exception catch (e) {
      log.e(e.toString());
      return null;
    }
  }

  // https://api.zuri.chat/users/user_id

}
