import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../general_widgets/app_toast.dart';
import '../../../../models/workspace_model.dart';
import '../../../../package/base/server-request/workspace_request/workspace_api_service.dart';
import '../../../../services/connectivity_service.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';

class WorkspaceViewModel extends BaseViewModel {
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

//TODO change this to fetch the list of organizations the user is part of alone
//SHould not return all organizations but the ones the user has joined
  Future fetchOrganizations() async {
    try {
      if (!await connectivityService.checkConnection()) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: 'Check your internet connection',
        );

        return;
      }
      setBusy(true);
      workspaces = await api.fetchListOfOrganizations();
      filterWorkspace();
      setBusy(false);
    } catch (e) {
      print(e.toString());
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

  Future<void> onTap(String id) async {
    try {
      if (id == currentOrgId) {
        navigation.popRepeated(1);
        return;
      }
      if (!await connectivityService.checkConnection()) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: 'Check your internet connection',
        );
        return;
      }
      final workspaces = await api.fetchOrganizationInfo(id);
      print(workspaces);
      await storageService.setString(StorageKeys.currentOrgId, id);
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: 'You have entered ${workspaces.name}',
      );
      storageService.setString(StorageKeys.currentOrgName, workspaces.name!);
      storageService.setString(
          StorageKeys.currentOrgUrl, workspaces.workSpaceUrl!);
      navigation.navigateTo(Routes.navBarView);
      navigation.popRepeated(1);
    } catch (e) {
      print(e.toString());
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Error fetching Organization Info',
      );
    }
  }

  String? get currentOrgId =>
      storageService.getString(StorageKeys.currentOrgId);
}
