import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordOtpViewModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService();
  final _apiService = locator<HttpApiService>();
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool isLoading = false;

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToNewPassword() {
    _navigationService.navigateTo(Routes.forgotPasswordNewView);
  }

  Future verifyOtpCode(context) async {
    loading(true);
    const endpoint = '/account/verify-reset-password';
    if (otpController.text == '') {
      loading(false);
      AppSnackBar.failure(context, 'Please fill all fields.');
      return;
    }
    final validationData = {'code': otpController.text};
    final response = await _apiService.post(endpoint, data: validationData);
    loading(false);
    navigateToNewPassword();
    if (response?.statusCode == 200) {
      AppSnackBar.success(
        context,
        '''Password reset. Enter a new one.''',
      );
      navigateToNewPassword();
    } else {
      AppSnackBar.failure(
          context, response?.data['message'] ?? 'OTP could not be validated.');
    }
  }
}
