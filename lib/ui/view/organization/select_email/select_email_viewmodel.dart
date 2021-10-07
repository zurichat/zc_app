import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/storage_keys.dart';

class SelectEmailViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final _storage = locator<SharedPreferenceLocalStorage>();
  // final _api = WorkSpaceApiService();
  final _anotherEmail = UseAnotherEmail;

  String? get userEmail => _storage.getString(StorageKeys.currentUserEmail);
  String get anotherEmail => _anotherEmail;

  void onEmailTap(OrganizationSwitchMethod method) {
    switch (method) {
      case OrganizationSwitchMethod.signIn:
        navigateToOrganizationUrl();
        break;
      case OrganizationSwitchMethod.create:
        navigateToCreateOrganization();
        break;
      case OrganizationSwitchMethod.join:
        navigateToOrganizationUrl();
        break;
    }
  }

  void navigateToOrganizationUrl() {
    _navigation.navigateTo(Routes.organizationUrlView);
  }

  void navigateToCreateOrganization() {
    _navigation.navigateTo(
      Routes.createOrganization,
      arguments: CreateOrganizationArguments(email: userEmail!),
    );
  }

  navigateToUseDifferentEmailView() {
    _navigation.navigateTo(Routes.useDifferentEmailView);
  }

  String getScreenTitle(OrganizationSwitchMethod method) {
    switch (method) {
      case OrganizationSwitchMethod.create:
        return CreateWorkspace;
      case OrganizationSwitchMethod.signIn:
        return SignInWorkspace;
      case OrganizationSwitchMethod.join:
        return JoinWorkspace;
    }
  }
}
