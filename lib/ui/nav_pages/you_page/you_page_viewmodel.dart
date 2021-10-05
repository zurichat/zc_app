import 'package:hng/constants/app_strings.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class YouPageViewModel extends BaseViewModel {
  final log = getLogger('YouPageViewModel');
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String username = PaulEke;
  String profileImage = ZuriAppbarLogo;
  String currentStatus = Active;
  String otherStatus = Away;

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

 Future<void> viewProfile() async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.user,
      isScrollControlled: true,
    
    );

    log.i('confirmationResponse confirmed: ${sheetResponse?.confirmed}');
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
