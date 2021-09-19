import 'dart:developer';

import 'package:hng/app/app.logger.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/workspace_model.dart';
import '../../../../package/base/server-request/workspace_request/workspace_api_service.dart';
import '../../../../services/connectivity_service.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';

class WorkspaceViewModel extends BaseViewModel {
  final log = getLogger('WorkspaceViewModel');
  final navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final api = WorkSpaceApiService();
  List<WorkspaceModel> workspaces = [];

  void initViewModel() {
    fetchOrganizations();
  }

  Future<void> navigateToNewWorkspace() async {
    try {
      await navigation.navigateTo(Routes.addWorkspaceView);
      workspaces = await api.fetchListOfOrganizations();
      filterWorkspace();
      notifyListeners();
    } catch (e) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Error Updating Organizations',
      );
    }
  }

  //Returns the list of organisation the user is part of
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
      workspaces = await api.getJoinedOrganizations();
      // filterWorkspace();

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

//TODO change this to fetch the list of organizations the user is part of alone
  void filterWorkspace() {
    final ids = storageService.getStringList(StorageKeys.workspaceIds) ?? [];
    workspaces.retainWhere((e) => ids.any((id) => id == e.id));
  }

  Future<void> onTap(String id, String? name, String? url) async {
    try {
      if (id == currentOrgId) {
        navigation.replaceWith(Routes.navBarView);
        return;
      }
      await checkSnackBarConnectivity();

      await storageService.setString(StorageKeys.currentOrgId, id);
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

  checkSnackBarConnectivity() async {
    if (!await connectivityService.checkConnection()) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Check your internet connection',
      );
      return;
    }
  }

  String? get currentOrgId =>
      storageService.getString(StorageKeys.currentOrgId);
}
