import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class YouPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String username = "Oscar";
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

  Future viewSavedItem() async {
    await _navigationService.navigateTo(Routes.savedItemsView);
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

    print('confirmationResponse confirmed: ${sheetResponse?.confirmed}');
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
