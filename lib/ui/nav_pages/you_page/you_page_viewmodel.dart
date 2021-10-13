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
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/view/set_status/set_status_view.form.dart';

class YouPageViewModel extends ReactiveViewModel {
  final log = getLogger('YouPageViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _connectivityService = locator<ConnectivityService>();
  final _apiService = ZuriApi(coreBaseUrl);
  final _snackbarService = locator<SnackbarService>();
  final _statusService = locator<StatusService>();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_statusService];

  String? get orgId => _storageService.getString(StorageKeys.currentOrgId);
  String? get memberId =>
      _storageService.getString(StorageKeys.idInOrganization);
  String? get token =>
      _storageService.getString(StorageKeys.currentSessionToken);

  String get username =>
      (_userService.userDetails?.displayName?.isNotEmpty ?? false
          ? _userService.userDetails?.displayName
          : _userService.userDetails?.fullName) ??
      PaulEke;
  String profileImage = ZuriAppbarLogo;
  String currentStatus = Active;
  String otherStatus = Away;

  final String hintText = SetAStatus;
  String _statusText = 'What\'s your status';
  String get statusText => _statusText;
  final tagIcon = bubble;
  var iconData = '';
  bool isLoading = false;

  fetchStatus() async {
    _statusText = _statusService.statusText;
    final endpoint = 'organizations/$orgId/members/$memberId';
    final response =
        await _apiService.get(endpoint, queryParameters: {}, token: token);

    if (response != null) {
      _statusText = response.data['data']['status']['text'];
      iconData = response.data['data']['status']['tag'];
      notifyListeners();
    } else {}
  }

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  clear() {}

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

  Future<void> signOutAccount() async {
    bool connected = await _connectivityService.checkConnection();
    const endpoint = "/auth/logout";
    if (!connected) {
      _snackbarService.showCustomSnackBar(
          message: "No internet connection, connect and try again.",
          variant: SnackbarType.failure,
          duration: const Duration(milliseconds: 1500));
      return;
    }

    final response = await _apiService.post(endpoint, body: {}, token: token);

    if (response?.statusCode == 200) {
      _storageService.clearData(StorageKeys.currentOrgId);
      _storageService.clearData(StorageKeys.currentOrgUrl);
      _storageService.clearData(StorageKeys.currentOrgName);
      navigateToOrgView();
    }
  }

  Future setStatus() async {
    await _navigationService.navigateTo(Routes.setStatusView);
  }

  void exitPage() {
    notifyListeners();
    _navigationService.back();
    notifyListeners();
  }

  Future clearAfter() async {
    await _navigationService.navigateTo(Routes.clearAfterView);
  }
}

class StatusService with ReactiveServiceMixin {
  StatusService() {
    listenToReactiveValues([_statusText]);
  }
  final _statusText = ReactiveValue<String>('What\'s your status');
  String get statusText => _statusText.value;

  void updateStatusText(statusText) => _statusText.value = statusText;
}
