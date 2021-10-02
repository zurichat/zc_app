// import 'package:hng/services/user_service.dart';
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
  // final _userService = locator<UserService>();
  final api = OrganizationApiService();
  List<OrganizationModel> organizations = [];

  void initViewModel() {
    fetchOrganizations();
    getOrganizationMemberList();
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
        message: 'Error Updating Organizations',
      );
    }
  }

  //Returns the list of Organization the user is part of
  Future fetchOrganizations() async {
    if (!await connectivityService.checkConnection()) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Check your internet connection',
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
        message: 'Error Occured',
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
        message: 'Error fetching Organization Info',
      );
    }
  }

  Future<void> checkSnackBarConnectivity() async {
    if (!await connectivityService.checkConnection()) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Check your internet connection',
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
        message: 'Check your internet connection',
      );
      return;
    }

    try {
      setBusy(true);
      var orgId = currentOrgId ?? '61459d8e62688da5302acdb1';
      // print('${currentOrgId} currentOrgId');

      // print('Organization id from user service ${_userService.currentOrgId}');

      if (orgId.isNotEmpty) {
        final orgMemberList = await api.getOrganizationMemberList(orgId);

        // print('Organization member list length ${orgMemberList.data.length}');

        if (orgMemberList.data.isNotEmpty) {
          storageService.setString(StorageKeys.organizationMemberList,
              jsonEncode(orgMemberList.data));
        }
        // print(
        //     'Stored Organization Member list ${storageService.getString(StorageKeys.organizationMemberList)}');
      }
      setBusy(false);
    } catch (e) {
      log.i(e.toString());
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'An unexpected error occurred',
      );
    }
  }

  String? get currentOrgId =>
      storageService.getString(StorageKeys.currentOrgId);

  Future<void> viewPreferences() async {
    await navigation.navigateTo(Routes.preferenceView);
  }
}
