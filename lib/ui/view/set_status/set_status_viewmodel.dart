import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/status_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';

class SetStatusViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _zuriApi = ZuriApi(coreBaseUrl);
  final _snackbarService = locator<SnackbarService>();
  final String hintText = SetAStatus;
  final tagIcon = bubble;
  bool isLoading = false;
  String _statusText = '';
  String get statusText => _statusText;
  final _statusService = locator<StatusService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_statusService];

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  statusValueText(value) {
    _statusText = value;
  }

  void exitPage() {
    _navigationService.back();
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
      'text': _statusText,
      'expiry_time': 'dont_clear'
    };
    try {
      final response = await _zuriApi.patch('$coreBaseUrl$endpoint',
          body: data, token: token);

      if (response != null && response.statusCode == 200) {
        _storageService.setString(StorageKeys.statusText, _statusText);
        // _storageService.setString('status_tag', tagValue!);
        _statusService.updateStatusText(_statusText);
      }
      loading(false);
      exitPage();
    } catch (e) {
      loading(false);
      _snackbarService.showCustomSnackBar(
        message: e.toString(),
        variant: SnackbarType.failure,
        duration: const Duration(seconds: 2),
      );
    }
  }

  clear() {}
}
