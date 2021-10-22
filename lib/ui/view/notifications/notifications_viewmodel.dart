import 'package:zurichat/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NotificationsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool vibrate = true;
  bool light = true;
  bool inAppNotification = true;
  bool notifyOnKeyword = true;

  goBack() => _navigationService.back();

  void toggleVibrate(bool value) {
    vibrate = value;
    notifyListeners();
  }

  void toggleLight(bool value) {
    light = value;
    notifyListeners();
  }

  void toggleInAppNotification(bool value) {
    inAppNotification = value;
    notifyListeners();
  }

  void toggleNotifyOnKeyword(bool value) {
    notifyOnKeyword = value;
    notifyListeners();
  }
}
