import 'package:hng/app/app.router.dart';
import 'package:flutter/widgets.dart';
import 'package:hng/utilities/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordEmailViewModel extends BaseViewModel with Validators {
  TextEditingController emailController = TextEditingController();
  final validateKey = GlobalKey<FormState>();
  NavigationService _navigationService = NavigationService();
  void navigateToOtp() {
    _navigationService.navigateTo(Routes.forgotPasswordOtpView);
  }

  void navigateToSignIn() {
    _navigationService.navigateTo(Routes.loginView);
  }

  // ignore: non_constant_identifier_names

}
