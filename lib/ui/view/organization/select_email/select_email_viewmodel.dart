import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/storage_keys.dart';

class SelectEmailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _storage = locator<SharedPreferenceLocalStorage>();
  final _anotherEmail = UseAnotherEmail;

  String? get userEmail => _storage.getString(StorageKeys.currentUserEmail);

  String get anotherEmail => _anotherEmail;

  void back() => _navigationService.back();

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
    _navigationService.navigateTo(
      Routes.organizationUrlView,
      arguments: OrganizationUrlViewArguments(email: userEmail!),
    );
  }

  void navigateToCreateOrganization() {
    _navigationService.navigateTo(
      Routes.createOrganization,
      arguments: CreateOrganizationArguments(email: userEmail!),
    );
  }

  void navigateToDifferentEmail(OrganizationSwitchMethod method) {
    _navigationService.navigateTo(
      Routes.useDifferentEmailView,
      arguments: UseDifferentEmailViewArguments(method: method),
    );
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

  //void back() => _navigationService.popRepeated(1);
}
