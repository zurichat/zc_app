import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
// import '../../../../services/local_storage_services.dart';

class CreateOrganizationViewModel extends BaseViewModel {
  // final _navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  // final _storage = locator<SharedPreferenceLocalStorage>();
  // final _api = OrganizationApiService();
  final textController = TextEditingController();
  bool? _checkBoxVal = false;

  final pageController = PageController(initialPage: 2);

  // String? get userEmail => _storage.getString(StorageKeys.currentUserEmail);
  // String get anotherEmail => _anotherEmail;

  // void onEmailTap(WorkspaceSwitchMethod method) {
  //   switch (method) {
  //     case WorkspaceSwitchMethod.SignIn:
  //       navigateToWorkSpaceUrl();
  //       break;
  //     case WorkspaceSwitchMethod.Create:
  //       // TODO: Handle this case.
  //       break;
  //     case WorkspaceSwitchMethod.Join:
  //       navigateToWorkSpaceUrl();
  //       break;
  //   }
  // }

  // void navigateToWorkSpaceUrl() {
  //   _navigation.navigateTo(Routes.workspaceUrlView);
  // }

  // Future<WorkspaceModel?> createOrganization(
  //     String email, WorkspaceModel org) async {
  //   try {
  //     final id = await _api.createOrganization(email);
  //     await _api.updateOrgName(id, org.name!);
  //     await _api.updateOrgUrl(id, org.workSpaceUrl!);
  //     await _api.updateOrgLogo(id, org.logoUrl!);
  //     // return WorkspaceModel(
  //     //   id: id,
  //     //   name: org.name,
  //     //   workSpaceUrl: org.workSpaceUrl,
  //     //   logoUrl: org.logoUrl,
  //     //   time: null,
  //     // );
  //   } catch (e) {
  //     snackbar.showSnackbar(message: e.toString());
  //   }
  // }

  void onCheckBoxChanged(bool? value) {
    _checkBoxVal = value;
    notifyListeners();
  }

  bool? get checkBoxVal => _checkBoxVal;

  void onInviteTap() {}

  void next() {
    pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
  }
}
