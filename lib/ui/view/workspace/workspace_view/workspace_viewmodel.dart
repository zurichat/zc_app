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
  List<WorkspaceModel> workspaces = [];

  void navigateToNewWorkspace() {
    navigation.navigateTo(Routes.addWorkspaceView);
  }

  Future fetchOrganizations() async {
    try {
      if (!await connectivityService.checkConnection()) {
        AppToast.instance.message(null, 'Check your internet connection');
        return;
      }
      setBusy(true);
      workspaces = await api.fetchListOfOrganizations();
      setBusy(false);
    } catch (e) {
      print(e.toString());
      AppToast.instance.error(null, 'Error Occured');
    }
  }

  Future<void> onTap(String id) async {
    try {
      if (id == currentOrgId) {
        navigation.navigateTo(Routes.homePage);
        return;
      }
      if (!await connectivityService.checkConnection()) {
        AppToast.instance.message(null, 'Check your internet connection');
        return;
      }
      final workspaces = await api.fetchOrganizationInfo(id);
      print(workspaces);
      await storageService.setString(
          StorageKeys.currentOrgId, workspaces.first.id);
      AppToast.instance
          .success('Success!', 'You have entered ${workspaces.first.name}');
      navigation.navigateTo(Routes.homePage);
    } catch (e) {
      print(e.toString());
      AppToast.instance.error(null, 'Error Occured');
    }
  }

  String? get currentOrgId =>
      storageService.getString(StorageKeys.currentOrgId);
}
