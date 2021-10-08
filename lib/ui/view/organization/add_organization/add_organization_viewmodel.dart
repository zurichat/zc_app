import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../utilities/enums.dart';

class AddOrganizationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  void back() => _navigationService.back();
  void navigateToSelectEmail(OrganizationSwitchMethod method) {
    _navigationService.navigateTo(
      Routes.selectEmail,
      arguments: SelectEmailArguments(method: method),
    );
  }
}
