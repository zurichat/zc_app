import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class YouPageViewModel extends BaseViewModel {
  final log = getLogger('YouPageViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String username = "pauleke65";
  String profileImage = "assets/background/appBarLogo.png";
  String currentStatus = "Active";
  String otherStatus = "away";

  Future editProfile() async {
    await _navigationService.navigateTo(Routes.editProfileView);
  }

  Future pauseNotifications() async {
    await _navigationService.navigateTo(Routes.doNotDisturbView);
  }

  void toggleStatus() {
    currentStatus == "Active"
        ? () {
            currentStatus = "Away";
            otherStatus = "active";
          }()
        : () {
            currentStatus = "Active";
            otherStatus = "away";
          }();
    notifyListeners();
  }

  void viewSavedItem() {
    _navigationService.navigateTo(Routes.savedItemsView);
  }

  void viewProfile() {
    _navigationService.navigateTo(Routes.viewProfile);
  }

  viewNotifications() {
    _navigationService.navigateTo(Routes.notificationsView);
  }

  void viewPreferences() {
    _navigationService.navigateTo(Routes.preferenceView);
  }

  void setStatus() {
    _navigationService.navigateTo(Routes.setStatusView);
  }
}
