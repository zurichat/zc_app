import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
    void navigateToJumpToScreen() {
    _navigationService.navigateTo(Routes.dmJumpToView);
  }
}
