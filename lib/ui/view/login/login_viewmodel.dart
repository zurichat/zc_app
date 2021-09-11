import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/services/api_service.dart';
import 'package:hng/services/local_storage_services.dart';

class LoginViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final apiService = locator<ApiService>();
  final storage = locator<SharedPreferenceLocalStorage>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;

  void navigateToHomeScreen() {
    navigationService.navigateTo(Routes.navBarView);
  }

  void navigateToSignUpScreen() {
    navigationService.navigateTo(Routes.signUpView);
  }

  void navigateToForgotPasswordScreen() {
    navigationService.navigateTo(Routes.forgotPasswordView);
  }

  // ignore: always_declare_return_types
  Future logInUser(context) async {
    isLoading = true;
    notifyListeners();
    const endpoint = '/auth/login';
    if (email.text == '' || password.text == '') {
      isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Please fill all fields.'),
        ),
      );
      return;
    }
    final signUpData = {
      'email': email.text,
      'password': password.text,
    };

    final response = await apiService.sendPostRequest(signUpData, endpoint);
    print('called $response');
    isLoading = false;
    notifyListeners();
    if (response != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text(
              '${response['message']} for ${response['data']['user']['email']}'),
        ),
      );

      navigationService.navigateTo(Routes.navBarView);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: Text('Error encountered during login.'),
        ),
      );
    }
  }
}
