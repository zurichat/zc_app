import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.locator.dart';
import '../../services/local_storage_services.dart';

class LoginViewModel extends BaseViewModel {
  final text = locator<SharedPreferenceLocalStorage>();
  TextEditingController userText = TextEditingController();

  void saveUserData() {
    text.setString('userInput', userText.text);
  }
}
