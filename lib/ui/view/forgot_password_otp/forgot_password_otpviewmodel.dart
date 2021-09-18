import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hng/app/app.router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordOtpViewModel extends BaseViewModel {
  NavigationService _navigationService = NavigationService();

  void navigateToNewPassword() {
    _navigationService.navigateTo(Routes.forgotPasswordNewView);
  }

  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
}
