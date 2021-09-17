import 'package:flutter/cupertino.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../general_widgets/app_toast.dart';
import '../../../../models/workspace_model.dart';
import '../../../../package/base/server-request/workspace_request/workspace_api.dart';
import '../../../../services/connectivity_service.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';

class WorkspaceViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final api = WorkSpaceApi();
  late BuildContext context;
  List<WorkspaceModel> workspaces = [];

  void initViewModel(BuildContext ctx) {
    context = ctx;
    fetchOrganizations();
  }

  Future<void> navigateToNewWorkspace() async {
    try {
      await navigation.navigateTo(Routes.addWorkspaceView);
      workspaces = await api.fetchListOfOrganizations();
      filterWorkspace();
      notifyListeners();
    } catch (e) {
      AppSnackBar.failure(context, 'Error Updating Organizations');
    }
  }

  Future fetchOrganizations() async {
    try {
      if (!await connectivityService.checkConnection()) {
        AppToast.instance.message(null, 'Check your internet connection');
        return;
      }
      setBusy(true);
      workspaces = await api.fetchListOfOrganizations();
      filterWorkspace();
      setBusy(false);
    } catch (e) {
      print(e.toString());
      AppSnackBar.failure(context, 'Error Occured');
    }
  }

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
        AppToast.instance.message(null, 'Check your internet connection');
        return;
      }
      final workspaces = await api.fetchOrganizationInfo(id);
      print(workspaces);
      await storageService.setString(StorageKeys.currentOrgId, id);
      AppSnackBar.success(context, 'You have entered ${workspaces.name}');
      navigation.popRepeated(1);
    } catch (e) {
      print(e.toString());
      AppSnackBar.failure(context, 'Error fetching Organization Info');
    }
  }

  String? get currentOrgId =>
      storageService.getString(StorageKeys.currentOrgId);
}
