import 'package:hng/constants/app_strings.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/notification_service.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


import '../../../app/app.locator.dart';

class DoNotDisturbViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _notificationService = locator<NotificationService>();
  final _sharedPreference = locator<SharedPreferenceLocalStorage>();
  List doNotDisturbTimes = [
    ThirtyMins,
    OneHour,
    TwoHours,
    UntilTomorrow,
    Custom,
  ];
  List addTime = [
    30,
    60,
    120,
    1440,
    100000000
  ];

  int? currentValue = 0;

  void exitPage() {
    _navigationService.back();
  }

  void changeTime(int? value) {
    currentValue = value;
    DateTime now = DateTime.now();

    var toAdd = Duration(minutes: addTime[value ?? 0]);
    DateTime futureTime = now.add(toAdd);
    double time = futureTime.millisecondsSinceEpoch.toDouble();
    _notificationService.setCanShowNotification(time as int);

    _sharedPreference.setDouble(StorageKeys.doNotDisturb, time);
    notifyListeners();
  }

}
