import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomUserBottomSheetViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future setStatus() async {
    await _navigationService.navigateTo(Routes.setStatusView);
  }

  Future editProfile() async {
    await _navigationService.navigateTo(Routes.editProfileView);
  }
}
