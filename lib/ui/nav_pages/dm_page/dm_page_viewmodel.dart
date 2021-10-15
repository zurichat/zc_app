import 'package:hng/services/local_storage_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmPageViewModel extends FutureViewModel<bool> {
  final navigationService = locator<NavigationService>();
  final storageService = locator<SharedPreferenceLocalStorage>();

  Future<bool> getActiveDMs() async {
    await Future.delayed(const Duration(seconds: 1));
    return false;
  }

  goBack() => navigationService.back();

  void navigateToDmUserView() {
    navigationService.navigateTo(Routes.dmUserView);
  }

  void navigateToDmScreen() {
    navigationService.navigateTo(Routes.dmScreen);
  }

  void navigateToJumpToScreen() {
    navigationService.navigateTo(Routes.dmJumpToView);
  }

  @override
  Future<bool> futureToRun() {
    return getActiveDMs();
  }
}
