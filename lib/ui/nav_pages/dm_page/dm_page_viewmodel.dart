import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmPageViewModel extends BaseViewModel {

  void navigateToDmUser() {
    locator<NavigationService>().navigateTo(Routes.dmUserView);
  }
}
