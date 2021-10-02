import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:convert';
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

  void initViewModel() {
    fetchOrganizations();
    fetchOrganizationMemberList();
  }

  Future<void> navigateToNewOrganization() async {
    try {
      await navigation.navigateTo(Routes.addOrganizationView);
      organizations = await api.getJoinedOrganizations();
      // filterOrganization();
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
      //filterOrganization();

      setBusy(false);
    } catch (e) {
      log.i(e.toString());
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: errorOccurred,
      );
    }
  }

// ignore: todo
//TODO change this to fetch the list of organizations the user is part of alone
  void filterOrganization() {
    final ids = storageService.getStringList(StorageKeys.organizationIds) ?? [];
    organizations.retainWhere((e) => ids.any((id) => id == e.id));
  }

  Future<void> onTap(String? id, String? name, String? url) async {
    try {
      if (id == currentOrgId) {
        navigation.replaceWith(Routes.navBarView);
        return;
      }
      await checkSnackBarConnectivity();

      await storageService.setString(StorageKeys.currentOrgId, id!);
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: 'You have entered $name',
      );
      storageService.setString(StorageKeys.currentOrgName, name!);
      storageService.setString(StorageKeys.currentOrgUrl, url!);

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
  Future fetchOrganizationMemberList() async {
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
      var orgId = currentOrgId ?? '';

      if (orgId.isNotEmpty) {
        final orgMemberList = await api.getOrganizationMemberList(orgId);

        if (orgMemberList.isNotEmpty) {
          storageService.setString(
              StorageKeys.organizationMemberList, jsonEncode(orgMemberList));
        }
      }
      setBusy(false);
    } catch (e) {
      log.i(e.toString());
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: errorOccurred,
      );
    }
  }

  String? get currentOrgId =>
      storageService.getString(StorageKeys.currentOrgId);

  Future<void> viewPreferences() async {
    await navigation.navigateTo(Routes.preferenceView);
  }
}
