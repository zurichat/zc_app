import 'package:stacked/stacked.dart';

class SignUpViewModel extends BaseViewModel {
  bool checkBoxValue = false;
  void updateValue(newValue) {
    checkBoxValue = newValue;
    notifyListeners();
  }
}
