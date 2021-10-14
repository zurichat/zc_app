import 'dart:convert';

import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/ui/nav_pages/home_page/widgets/home_list_items.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../models/organization_model.dart';
import '../../../../package/base/server-request/organization_request/organization_api_service.dart';
import '../../../../services/connectivity_service.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/storage_keys.dart';

class OrganizationViewModel extends BaseViewModel {
  final log = getLogger('OrganizationViewModel');
  final navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final api = OrganizationApiService();
  List<OrganizationModel> organizations = [];
  final _bottomSheetService = locator<BottomSheetService>();
  final _storage = locator<SharedPreferenceLocalStorage>();
  final _snackBar = locator<SnackbarService>();
  final _connectivityService = locator<ConnectivityService>();
  final _apiService = ZuriApi(coreBaseUrl);

  void initViewModel() {
    fetchOrganizations();
    getOrganizationMemberList();
  }

  Future<void> navigateToNewOrganization() async {
    try {
      await navigation.navigateTo(Routes.addOrganizationView);
      organizations = await api.getJoinedOrganizations();
      notifyListeners();
    } catch (e) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: UpdateFailed,
      );
    }
  }

  //Returns the list of Organization the user is part of
  Future fetchOrganizations() async {
    if (!await connectivityService.checkConnection()) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: noInternet,
      );

      return;
    }

    try {
      setBusy(true);
      final resFromApi = await api.getJoinedOrganizations();
      if (resFromApi.isEmpty) {
        organizations = [];
      } else {
        organizations = resFromApi;
      }

      setBusy(false);
    } catch (e) {
      log.i(e.toString());
    }
  }

//TODO change this to fetch the list of organizations the user is part of alone
  void filterOrganization() {
    final ids = storageService.getStringList(StorageKeys.organizationIds) ?? [];
    organizations.retainWhere((e) => ids.any((id) => id == e.id));
  }

  Future<void> onTap(OrganizationModel? org) async {
    try {
      if (org!.id == currentOrgId) {
        navigation.replaceWith(Routes.navBarView);
        return;
      }
      await checkSnackBarConnectivity();

      await storageService.setString(StorageKeys.currentOrgId, org.id!);
      await storageService.setString(
          StorageKeys.idInOrganization, org.userIdInOrg!);
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: 'You have entered ${org.name}',
      );
      storageService.setString(StorageKeys.currentOrgName, org.name!);
      storageService.setString(StorageKeys.currentOrgUrl, org.organizationUrl!);
      storageService.setString(StorageKeys.currentOrgLogo, org.logoUrl!);

      navigation.replaceWith(Routes.navBarView);
    } catch (e) {
      log.i(e.toString());
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: FetchError,
      );
    }
  }

  Future<void> checkSnackBarConnectivity() async {
    if (!await connectivityService.checkConnection()) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: noInternet,
      );
      return;
    }
  }

  //Returns the list of members of an Organization
  Future getOrganizationMemberList() async {
    if (!await connectivityService.checkConnection()) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: noInternet,
      );
      return;
    }

    try {
      setBusy(true);
      var orgId = currentOrgId ?? ''; // ?? '61459d8e62688da5302acdb1';

      if (orgId.isNotEmpty) {
        final orgMemberList = await api.getOrganizationMemberList(orgId);

        if (orgMemberList.data.isNotEmpty) {
          storageService.setString(StorageKeys.organizationMemberList,
              jsonEncode(orgMemberList.data));
        }
      }
      setBusy(false);
    } catch (e) {
      log.i(e.toString());
    }
  }

  String? get currentOrgId =>
      storageService.getString(StorageKeys.currentOrgId);

  Future<void> viewPreferences() async {
    await navigation.navigateTo(Routes.preferenceView);
  }

  String? get token => _storage.getString(StorageKeys.currentSessionToken);

  Future<void> showSignOutBottomSheet(OrganizationModel org) async {
    await _bottomSheetService.showCustomSheet(
      barrierColor: AppColors.blackColor,
      variant: BottomSheetType.signOut,
      isScrollControlled: true,
      data: org,
    );
    organizations = await api.getJoinedOrganizations();
    notifyListeners();
  }

  void navigateToSignIn() =>
      navigationService.pushNamedAndRemoveUntil(Routes.loginView);

  Future<void> signOutAllOrg() async {
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
      _storage.clearData(StorageKeys.currentSessionToken);
      _storage.clearData(StorageKeys.currentUserId);
      _storage.clearData(StorageKeys.currentUserEmail);
      _storage.clearData(StorageKeys.otp);
      _storage.clearData(StorageKeys.organizationIds);
      _storage.clearData(StorageKeys.registeredNotverifiedOTP);
      _storage.clearData(StorageKeys.currentOrgUrl);
      _storage.clearData(StorageKeys.currentMemberID);
      _storage.clearData(StorageKeys.displayName);
      _storage.clearData(StorageKeys.firstName);
      _storage.clearData(StorageKeys.status);
      _storage.clearData(StorageKeys.phoneNum);
      _storage.clearData(StorageKeys.currentUserImageUrl);
      _storage.clearData(StorageKeys.currentChannelId);
      _storage.clearData(StorageKeys.organizationMemberList);
      _storage.clearData(StorageKeys.savedItem);
      _storage.clearData(StorageKeys.idInOrganization);

      navigateToSignIn();
    }
  }
}
