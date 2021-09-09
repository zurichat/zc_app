import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/api_service.dart';
import '../../../services/local_storage_services.dart';

class LoginViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final apiService = locator<ApiService>();
  final storage = locator<SharedPreferenceLocalStorage>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
  logInUser() async {
    const endpoint = '/users';
    final signUpData = {
      'email': email.text,
      'password': password.text,
    };
    final response = await apiService.sendPostRequest(signUpData, endpoint);
    print('called');
    storage.setString('userID', response['data']['InsertedID']);
    navigationService.navigateTo(Routes.loginView);
  }
}
