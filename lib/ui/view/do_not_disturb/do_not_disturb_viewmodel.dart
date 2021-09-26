import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class DoNotDisturbViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  List doNotDisturbTimes = [
    '30 minutes',
    '1 hour',
    '2 hours',
    'Until tomorrow',
    'Custom',
  ];
  int? currentValue = 0;

  void exitPage() {
    _navigationService.back();
  }

  void changeTime(int? value) {
    currentValue = value;
    notifyListeners();
  }
}
