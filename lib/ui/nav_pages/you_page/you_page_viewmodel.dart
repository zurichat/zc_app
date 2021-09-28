import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class YouPageViewModel extends BaseViewModel {
  final log = getLogger('YouPageViewModel');
  final _navigationService = locator<NavigationService>();

  String username = 'pauleke65';
  String profileImage = 'assets/background/appBarLogo.png';
  String currentStatus = 'Active';
  String otherStatus = 'away';

  Future editProfile() async {
    await _navigationService.navigateTo(Routes.editProfileView);
  }

  Future pauseNotifications() async {
    await _navigationService.navigateTo(Routes.doNotDisturbView);
  }

  void toggleStatus() {
    currentStatus == 'Active'
        ? () {
            currentStatus = 'Away';
            otherStatus = 'active';
          }()
        : () {
            currentStatus = 'Active';
            otherStatus = 'away';
          }();
    notifyListeners();
  }

  Future viewSavedItem() async {
    await _navigationService.navigateTo(Routes.savedItemsView);
  }

  Future viewProfile() async {
    _navigationService.navigateTo(Routes.viewProfile);
  }

  Future viewNotifications() async {
    await _navigationService.navigateTo(Routes.notificationsView);
  }

  Future viewPreferences() async {
    await _navigationService.navigateTo(Routes.preferenceView);
  }

  Future setStatus() async {
    await _navigationService.navigateTo(Routes.setStatusView);
  }
}
