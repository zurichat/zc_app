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
}
