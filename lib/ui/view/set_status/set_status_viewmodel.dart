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
import 'package:hng/app/app.logger.dart';

class SetStatusViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _zuriApi = ZuriApi(coreBaseUrl);
  final _snackbarService = locator<SnackbarService>();
  final _statusService = locator<StatusService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final log = getLogger('SetStatusViewModel');
  final String hintText = SetAStatus;
  bool isLoading = false;
  String? _tagIcon;
  String _statusText = '';
  String? get tagIcon => _tagIcon;
  String get statusText => _statusText;

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
      'tag': _tagIcon,
      'text': _statusText,
      'expiry_time': 'dont_clear'
    };
    try {
      final response = await _zuriApi.patch('$coreBaseUrl$endpoint',
          body: data, token: token);

      if (response != null && response.statusCode == 200) {
        _storageService.setString(StorageKeys.statusText, _statusText);
        if (tagIcon != null) {
          _storageService.setString('status_tag_icon', _tagIcon!);
        }
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

  Future addEmojiTag() async {
    String? emoji;
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.emojiPicker,
      isScrollControlled: true,
    );

    if (sheetResponse!.confirmed == true) {
      emoji = sheetResponse.data.emoji;
      log.i('QQQ - ${emoji.hashCode}');
      _tagIcon = emoji;
      notifyListeners();
    }
  }

  clear() {}
}
