import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/organization_model.dart';
import '../../../../package/base/server-request/organization_request/organization_api_service.dart';
import '../../../../utilities/enums.dart';
// import '../../../../services/local_storage_services.dart';

class CreateOrganizationViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  // final _storage = locator<SharedPreferenceLocalStorage>();
  final _api = OrganizationApiService();
  final companyController = TextEditingController();
  final projectController = TextEditingController();
  final inviteController = TextEditingController();
  bool? _checkBoxVal = false;
  late OrganizationModel? org;

  final pageController = PageController();

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

  Future<OrganizationModel?> createOrganization(
      String email, String name) async {
    try {
      final organization = name.toLowerCase();
      final id = await _api.createOrganization(email);
      await _api.updateOrgName(id, name);
      await _api.updateOrgUrl(id, '$organization.zurichat.com');
      // await _api.updateOrgLogo(id, org.logoUrl!);
      return OrganizationModel(
        id: id,
        name: name,
        organizationUrl: '$organization.zurichat.com',
        logoUrl: null,
        time: null,
        isOwner: true,
        noOfMembers: 0,
      );
    } catch (e) {
      print(e.toString());
      snackbar.showSnackbar(message: e.toString());
    }
  }

  void onCheckBoxChanged(bool? value) {
    _checkBoxVal = value;
    notifyListeners();
  }

  bool? get checkBoxVal => _checkBoxVal;

  void onInviteTap() {
    snackbar.showCustomSnackBar(
        message: 'Coming soon!!', variant: SnackbarType.failure);
  }

  Future<void> onCompanyNext(String email) async {
    if (companyController.text.isEmpty) {
      return snackbar.showCustomSnackBar(
          message: 'Must not be empty', variant: SnackbarType.failure);
    }
    setBusy(true);
    org = await createOrganization(email, companyController.text);
    setBusy(false);
    next();
  }

  void next() {
    pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
  }

  Future<void> addTeammates() async {
    if (inviteController.text.isEmpty) {
      return snackbar.showCustomSnackBar(
          message: 'Must not be empty', variant: SnackbarType.failure);
    }
    if (org == null) {
      print('org is null oooo');
      return snackbar.showCustomSnackBar(
          message: 'Org is null oooo', variant: SnackbarType.failure);
    }
    setBusy(true);
    await _api.addMemberToOrganization(org!.id!, inviteController.text);
    setBusy(false);
    _navigation
        .popUntil((route) => route.settings.name == Routes.organizationView);
  }
}
