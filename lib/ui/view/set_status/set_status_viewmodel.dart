import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/nav_pages/you_page/you_page.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/set_status/set_status_view.form.dart';

class SetStatusViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _zuriApi = ZuriApi(coreBaseUrl);
  final _snackbarService = locator<SnackbarService>();
  final String hintText = SetAStatus;
  final tagIcon = bubble;
  bool isLoading = false;

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void exitPage({statusText}) {
    _navigationService.navigateToView(YouPage(
      statusText: statusValue,
    ));
  }

  Future clearAfter() async {
    await _navigationService.navigateTo(Routes.clearAfterView);
  }

  saveStatus() async {
    loading(true);
    final orgId = _storageService.getString(StorageKeys.currentOrgId);
    final memberId = _storageService.getString(StorageKeys.idInOrganization);
    final token = _storageService.getString(StorageKeys.currentSessionToken);
    final endpoint = 'organizations/$orgId/members/$memberId/status';
    final data = {
      'tag': ':ten:',
      'text': statusValue ?? '',
      'expiry_time': 'dont_clear'
    };
    try {
      final response = await _zuriApi.patch('$coreBaseUrl$endpoint',
          body: data, token: token);

      if (response != null && response.statusCode == 200) {
        _storageService.setString(StorageKeys.statusText, statusValue!);
        // _storageService.setString('status_tag', tagValue!);
      }
      loading(false);
      exitPage(statusText: statusValue ?? '');
    } catch (e) {
      loading(false);
      _snackbarService.showCustomSnackBar(
        message: 'message',
        variant: SnackbarType.failure,
        duration: const Duration(seconds: 2),
      );
    }
  }

  clear() {}

  @override
  void setFormStatus() {}
}
