import 'package:flutter/cupertino.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordEmailViewModel extends BaseViewModel {
  NavigationService _navigationService = NavigationService();
  void navigateToOtp() {
    _navigationService.navigateTo(Routes.forgotPasswordOtpView);
  }

  void navigateToSignIn() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
