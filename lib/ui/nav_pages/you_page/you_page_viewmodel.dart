import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
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
  String _presence = 'false';


  String get username =>
      (_userService.userDetails?.displayName?.isNotEmpty ?? false
          ? _userService.userDetails?.displayName
          : _userService.userDetails?.fullName) ??
      PaulEke;
  String profileImage = ZuriAppbarLogo;
  String currentStatus = Active;
  String otherStatus = Away;

  Future getUserPresence() async {
    try{
      final memberId = _storage.getString(StorageKeys.idInOrganization);
      String? orgId = _storage.getString(StorageKeys.currentOrgId);
      var response = await _apiService.get(
          '$coreBaseUrl/organizations/$orgId/members/$memberId',
        token: _userService.authToken
      );
      _presence = response.data['data']['presence'];
      log.i('response query ======= $_presence');
      otherStatus = _presence == 'true' ? 'away' : 'active';
      currentStatus = _presence == 'true' ? 'Active' : 'Away';
      notifyListeners();
    } catch(e) {
     e.toString();
    }
  }
  Future setUserPresence() async {
    try{
      final memberId = _storage.getString(StorageKeys.idInOrganization);
      String? orgId = _storage.getString(StorageKeys.currentOrgId);
      var response = await _apiService.post(
          coreBaseUrl+'organizations/$orgId/members/$memberId/presence',
          token: _userService.authToken, body: {
      },
      );
      log.i('response query ======= $response');
    } catch(e) {
      // log.i (e.toString());
    }
  }


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

  void toggleStatus() async {
    await runBusyFuture(setUserPresence());
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
