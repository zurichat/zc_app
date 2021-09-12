import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/general_widgets/app_toast.dart';
import 'package:hng/package/base/server-request/workspace_request/workspace_api.dart';
import 'package:hng/models/workspace_model.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WorkspaceViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final api = WorkSpaceApi();
  List<WorkspaceModel> workspaces = [];

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
