import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/workspace_request/workspace_api_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WorkspaceUrlViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();

  final api = WorkSpaceApiService();

  bool isEmpty = true;
  String _email = 'johndoe@gmail.com';
  String? url;
  var buttonColor = AppColors.greyishColor;

  void updateString(String value) {
    if (value.trim().isEmpty) {
      isEmpty = true;
      buttonColor = AppColors.greyishColor;
    } else {
      isEmpty = false;
      buttonColor = AppColors.appBarGreen;
    }
    url = value.trim();
    notifyListeners();
  }

  Future<void> signInToWorkspace() async {
    if (url != null && url!.isNotEmpty) {
      final workspace = await api.fetchWorkspaceByUrl(url!);
      await api.joinWorkspace(workspace.id!);

      //Set the organisation id to the currently signed in
      //This is the same has saving to the local storage
      _userService.setCurrentOrganisationId(workspace.id!);

      //Todo: storing should be implemented after stage 7
      // await storeWorkspaceId(workspace.id);

      navigation.navigateTo(Routes.navBarView);

      // popUntil((route) => route.settings.name == Routes.navBarView);
      // popUntil(ModalRoute.withName(Routes.workspaceView));
    }
    //TODO: put the error text
  }

  Future<void> storeWorkspaceId(String id) async {
    List<String> ids = storage.getStringList(StorageKeys.workspaceIds) ?? [];
    ids.add(id);
    await storage.setStringList(StorageKeys.workspaceIds, ids);
  }

  get buttonColors => buttonColor;
  bool get title => isEmpty;
  String get email => _email;
}
