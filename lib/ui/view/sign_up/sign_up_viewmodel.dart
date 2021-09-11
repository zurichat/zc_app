import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/api_service.dart';
import '../../../services/local_storage_services.dart';

class SignUpViewModel extends BaseViewModel {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController displayName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  bool isLoading = false;

  final navigation = locator<NavigationService>();
  final apiService = locator<ApiService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  bool checkBoxValue = false;
  void updateValue(newValue) {
    checkBoxValue = newValue;
    notifyListeners();
  }

  void navigateToSignIn() {
    navigation.navigateTo(Routes.loginView);
  }

  // ignore: always_declare_return_types
  createUser(context) async {
    isLoading = true;
    notifyListeners();
    const endpoint = '/users';
    final signUpData = {
      'first_name': firstName.text,
      'last_name': lastName.text,
      'display_name': displayName.text,
      'email': email.text,
      'password': password.text,
      'phone': phoneNumber.text,
    };
    final response = await apiService.sendPostRequest(signUpData, endpoint);
    isLoading = false;
    notifyListeners();
    if (response != null) {
      storage.setString('userID', response['data']['InsertedID']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 8),
          content: Text(response['message'] ?? 'Success'),
        ),
      );

      navigation.navigateTo(Routes.loginView);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 8),
          content: Text('Sign Up Error!!!'),
        ),
      );

      navigation.navigateTo(Routes.signUpView);
    }
  }
}
