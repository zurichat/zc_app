import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/package/base/server-request/api/zuri_api.dart';
import 'package:zurichat/services/connectivity_service.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/services/user_service.dart';
import 'package:zurichat/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:zurichat/utilities/constants.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class YouPageViewModel extends BaseViewModel {
  final log = getLogger('YouPageViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final _storage = locator<SharedPreferenceLocalStorage>();
  final _snackBar = locator<SnackbarService>();
  final _connectivityService = locator<ConnectivityService>();
  final _apiService = ZuriApi(coreBaseUrl);

  String get username =>
      (_userService.userDetails?.displayName?.isNotEmpty ?? false
          ? _userService.userDetails?.displayName
          : _userService.userDetails?.fullName) ??
      PaulEke;
  String profileImage = ZuriAppbarLogo;
  String currentStatus = Active;
  String otherStatus = Away;

  Future editProfile() async {
    await _navigationService.navigateTo(
      Routes.editProfileView,
      arguments: EditProfileViewArguments(user: _userService.userDetails!),
    );
    notifyListeners();
  }

  Future pauseNotifications() async {
    await _navigationService.navigateTo(Routes.doNotDisturbView);
  }

  void toggleStatus() {
    currentStatus == 'Active'
        ? () {
            currentStatus = 'Away';
            otherStatus = 'active';
          }()
        : () {
            currentStatus = 'Active';
            otherStatus = 'away';
          }();
    notifyListeners();
  }

  Future viewSavedItem() async {
    await _navigationService.navigateTo(Routes.savedItemsView);
  }

  Future<void> viewProfile() async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.user,
      isScrollControlled: true,
    );

    log.i('confirmationResponse confirmed: ${sheetResponse?.confirmed}');
    notifyListeners();
  }

  Future viewNotifications() async {
    await _navigationService.navigateTo(Routes.notificationsView);
  }

  Future viewPreferences() async {
    await _navigationService.navigateTo(Routes.preferenceView);
  }

  void navigateToOrgView() =>
      navigationService.clearStackAndShow(Routes.organizationView);

  String? get token => _storage.getString(StorageKeys.currentSessionToken);

  Future<void> signOutAccount() async {
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
      _storage.clearData(StorageKeys.currentOrgId);
      _storage.clearData(StorageKeys.currentOrgUrl);
      _storage.clearData(StorageKeys.currentOrgName);
      navigateToOrgView();
    }
  }

  Future setStatus() async {
    await _navigationService.navigateTo(Routes.setStatusView);
  }
}
