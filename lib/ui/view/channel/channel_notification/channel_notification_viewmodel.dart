import 'package:hng/constants/app_strings.dart';
import 'package:stacked/stacked.dart';

class ChannelNotificationViewModel extends BaseViewModel {
  String? value = New;

  void toggleOptions(String? val) {
    value = val;
    notifyListeners();
  }
}
