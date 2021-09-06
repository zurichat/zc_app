// import 'package:flutter/material.dart';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  void navigateToHomeScreen() {
    locator<NavigationService>().navigateTo(Routes.navBarView);
  }

  void navigateToSignUpScreen() {
    locator<NavigationService>().navigateTo(Routes.signUpView);
  }

  void navigateToForgotPasswordScreen() {
    locator<NavigationService>().navigateTo(Routes.forgotPasswordView);
  }
}