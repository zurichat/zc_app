
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/ui/shared/colors.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/mixins/validators_mixin.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UseDifferentEmailViewModel extends BaseViewModel with ValidatorMixin {
  bool? onClicked = false;

  updateColor() {
    onClicked = true;
    notifyListeners();
  }

  labelColor() {
    return onClicked == false ? AppColors.deepGreyColor : AppColors.whiteColor;
  }

  btnColor() {
    switch (onClicked) {
      case true:
        return AppColors.zuriPrimaryColor;

      case false:
        return AppColors.inactiveGreyColor;

      default:
        return AppColors.inactiveGreyColor;
    }
  }

  final _navigation = locator<NavigationService>();
  bool isEmpty = true;
  String email = '';

  void onNextTap(OrganizationSwitchMethod method) {
    if (validateEmail(email) != null) {
      return;
    }
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

  void updateScreen(String value) {
    isEmpty = value.isEmpty;
    email = value.trim();
    notifyListeners();
  }
}
