import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/models/workspace_model.dart';
import 'package:hng/package/base/server-request/workspace_request/workspace_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateWorkSpaceViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final _storage = locator<SharedPreferenceLocalStorage>();
  final _api = WorkSpaceApi();
  String _anotherEmail = 'Use another email address';

  String? get userEmail => _storage.getString(StorageKeys.currentUserEmail);
  String get anotherEmail => _anotherEmail;

  void onEmailTap(WorkspaceSwitchMethod method) {
    switch (method) {
      case WorkspaceSwitchMethod.SignIn:
        navigateToWorkSpaceUrl();
        break;
      case WorkspaceSwitchMethod.Create:
        // TODO: Handle this case.
        break;
      case WorkspaceSwitchMethod.Join:
        navigateToWorkSpaceUrl();
        break;
    }
  }

  void navigateToWorkSpaceUrl() {
    _navigation.navigateTo(Routes.workspaceUrlView);
  }

  Future<WorkspaceModel?> createOrganization(String email, WorkspaceModel org) async {
    try {
      final id = await _api.createOrganization(email);
      await _api.updateOrgName(id, org.name);
      await _api.updateOrgUrl(id, org.workSpaceUrl!);
      await _api.updateOrgLogo(id, org.logoUrl!);
      return WorkspaceModel(
        id: id,
        name: org.name,
        workSpaceUrl: org.workSpaceUrl,
        logoUrl: org.logoUrl,
        time: null,
      );
    } catch (e) {
      snackbar.showSnackbar(message: e.toString());
    }
  }
}
