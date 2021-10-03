

import 'package:hng/constants/app_strings.dart';
import 'package:hng/services/current_user_profile.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hng/models/profile_model.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class YouPageViewModel extends BaseViewModel {
  final log = getLogger('YouPageViewModel');
  ProfileModel currentUserData = ProfileModel();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final storage = locator<SharedPreferenceLocalStorage>();

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

  Future futureToRun() async {
    setBusy(true);
    currentUserData = await GetUserProfile().currentUser();
    setBusy(false);
  }

  Future viewProfile() async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.user,
      isScrollControlled: true,
      title: 'This is a floating bottom sheet',
      description:
          'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
      mainButtonTitle: 'Awesome!',
      secondaryButtonTitle: 'This is cool',
    );

    log.i('confirmationResponse confirmed: ${sheetResponse?.confirmed}');
  }

  Future viewNotifications() async {
    await _navigationService.navigateTo(Routes.notificationsView);
  }

  Future<void> view() async {
    await _navigationService.navigateTo(Routes.viewProfile);
  }

  Future viewPreferences() async {
    await _navigationService.navigateTo(Routes.preferenceView);
  }

  Future setStatus() async {
    await _navigationService.navigateTo(Routes.setStatusView);
  }
}
