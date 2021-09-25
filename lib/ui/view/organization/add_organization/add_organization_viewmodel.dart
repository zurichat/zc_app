import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddOrganizationViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();

  void navigateToSelectEmail(OrganizationSwitchMethod method) {
    navigation.navigateTo(
      Routes.selectEmail,
      arguments: SelectEmailArguments(
        method: method,
      ),
    );
  }
}
