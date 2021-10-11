import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/services/notification_service.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


import '../../../app/app.locator.dart';

class DoNotDisturbViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _notificationService = locator<NotificationService>();
  final _sharedPreference = locator<SharedPreferenceLocalStorage>();
  final _snackbarService = locator<SnackbarService>();
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
  bool notifsOn = false;
  void exitPage() {
    _navigationService.back();
  }
  init(){notifsOn = _sharedPreference.getBool('notification_on')?? false;
  notifyListeners();
  }

  resumeNotification(){
    _sharedPreference.setBool('notification_on', false);
    notifsOn = false;
    notifyListeners();
    exitPage();
  }


  void changeTime(int? value) async{
    currentValue = value;
    DateTime now = DateTime.now();
    _snackbarService.showCustomSnackBar(
      duration: const Duration(seconds: 2),
      variant: SnackbarType.success,
      message: "Notifications paused until ${DateFormat("hh:mm").format(now.add(Duration(minutes: addTime[value ??0])))}"
    );

    var toAdd = Duration(minutes: addTime[value ?? 0]);
    DateTime futureTime = now.add(toAdd);
    double time = futureTime.millisecondsSinceEpoch.toDouble();
    _notificationService.setCanShowNotification(time.toInt());
    _sharedPreference.setDouble(StorageKeys.doNotDisturb, time);
    ///move to storagekey
    _sharedPreference.setString('notification_status', '');


    _sharedPreference.setBool('notification_on', true);

    _navigationService.back(result: 'ON', id: 100);
    notifyListeners();
    exitPage();

  }

}
