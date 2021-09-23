import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/organization_model.dart';
import '../../../../package/base/server-request/Organization_request/Organization_api_service.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/storage_keys.dart';

class CreateOrganizationViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final _storage = locator<SharedPreferenceLocalStorage>();
  final _api = OrganizationApiService();
  final _anotherEmail = 'Use another email address';

  String? get userEmail => _storage.getString(StorageKeys.currentUserEmail);
  String get anotherEmail => _anotherEmail;

  void onEmailTap(OrganizationSwitchMethod method) {
    switch (method) {
      case OrganizationSwitchMethod.SignIn:
        navigateToOrganizationUrl();
        break;
      case OrganizationSwitchMethod.Create:
        // TODO: Handle this case.
        break;
      case OrganizationSwitchMethod.Join:
        navigateToOrganizationUrl();
        break;
    }
  }

  void navigateToOrganizationUrl() {
    _navigation.navigateTo(Routes.organizationUrlView);
  }

  Future<OrganizationModel?> createOrganization(
      String email, OrganizationModel org) async {
    try {
      final id = await _api.createOrganization(email);
      await _api.updateOrgName(id, org.name!);
      await _api.updateOrgUrl(id, org.organizationUrl!);
      await _api.updateOrgLogo(id, org.logoUrl!);
      // return OrganizationModel(
      //   id: id,
      //   name: org.name,
      //   OrganizationUrl: org.OrganizationUrl,
      //   logoUrl: org.logoUrl,
      //   time: null,
      // );
    } catch (e) {
      snackbar.showSnackbar(message: e.toString());
    }
  }
}
