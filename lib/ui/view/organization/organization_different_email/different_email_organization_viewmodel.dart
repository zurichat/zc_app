import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UseDifferentEmailViewModel extends BaseViewModel {
  final _navigation = locator<NavigationService>();
  bool isEmpty = true;
  String email = '';

  void onNextTap(OrganizationSwitchMethod method) {
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
    _navigation.navigateTo(
      Routes.organizationUrlView,
      arguments: OrganizationUrlViewArguments(email: email),
    );
  }

  void navigateToCreateOrganization() {
    _navigation.navigateTo(
      Routes.createOrganization,
      arguments: CreateOrganizationArguments(email: email),
    );
  }
}
