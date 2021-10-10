import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmPageViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  void navigateToDmUserView() {
    navigationService.navigateTo(Routes.dmUserView);
  }

  void navigateToDmScreen() {
    navigationService.navigateTo(Routes.dmScreen);
  }

  void navigateToJumpToScreen() {
    navigationService.navigateTo(Routes.dmJumpToView);
  }
}
