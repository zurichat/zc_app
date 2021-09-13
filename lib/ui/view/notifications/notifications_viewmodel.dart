import 'package:stacked/stacked.dart';

class NotificationsViewModel extends BaseViewModel {
  bool vibrate = true;
  bool light = true;
  bool inAppNotification = true;
  bool notifyOnKeyword = true;

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
