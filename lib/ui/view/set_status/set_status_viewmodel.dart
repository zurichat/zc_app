import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/set_status/set_status_view.form.dart';

class SetStatusViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();
  final _zuriApi = ZuriApi(coreBaseUrl);

  void exitPage() {
    _navigationService.back();
  }

  Future clearAfter() async {
    await _navigationService.navigateTo(Routes.clearAfterView);
  }

  saveStatus() async {
    final orgId = _storageService.getString(StorageKeys.currentOrgId);
    final memberId = _storageService.getString(StorageKeys.idInOrganization);
    final token = _storageService.getString(StorageKeys.currentSessionToken);
    final endpoint = 'organizations/$orgId/members/$memberId/status';
    final data = {
      "tag": statusValue,
      "text": "O tiya",
      "expiry_time": "dont_clear"
    };

    final response =
        await _zuriApi.patch('$coreBaseUrl$endpoint', body: data, token: token);
  }

  @override
  void setFormStatus() {}
}
