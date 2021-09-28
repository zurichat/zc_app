import 'package:stacked/stacked.dart';

class ChannelNotificationViewModel extends BaseViewModel {
  String? value = 'new';

  void toggleOptions(String? val) {
    value = val;
    notifyListeners();
  }
}
