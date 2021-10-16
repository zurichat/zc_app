import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/models/organization_model.dart';
import 'package:zurichat/package/base/server-request/api/zuri_api.dart';
import 'package:zurichat/services/connectivity_service.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/utilities/constants.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignOutBottomSheetViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _apiService = ZuriApi(coreBaseUrl);
  final _storage = locator<SharedPreferenceLocalStorage>();
  final _snackBar = locator<SnackbarService>();
  final _connectivityService = locator<ConnectivityService>();
  final _dialogService = locator<DialogService>();

  void showSignOutDialog(String orgName) async {
    final result = await _dialogService.showCustomDialog(
        variant: DialogType.signOut, data: orgName);
    if (result != null && result.confirmed) {
      signOut();
    }
  }

  void navigateToWorkSpaceSettings(OrganizationModel org) {
    _navigator.navigateTo(
      Routes.organizationSettingsView,
      arguments: OrganizationSettingsViewArguments(org: org),
    );
  }

  void navigateToInvitePage() {
    _navigator.navigateTo(Routes.inviteViaEmail);
  }

  void navigateToSignIn() =>
      _navigator.pushNamedAndRemoveUntil(Routes.loginView);

  void dismissDialog() => _navigator.back();

  Future<void> signOut() async {
    bool connected = await _connectivityService.checkConnection();
    const endpoint = "/auth/logout";
    if (!connected) {
      _snackBar.showCustomSnackBar(
          message: "No internet connection, connect and try again.",
          variant: SnackbarType.failure,
          duration: const Duration(milliseconds: 1500));
      return;
    }

    final response = await _apiService.post(endpoint, body: {}, token: token);

    if (response?.statusCode == 200) {
      _storage.clearData(StorageKeys.currentSessionToken);
      _storage.clearData(StorageKeys.currentUserId);
      _storage.clearData(StorageKeys.currentUserEmail);
      navigateToSignIn();
    }
  }

  String? get token => _storage.getString(StorageKeys.currentSessionToken);
}
