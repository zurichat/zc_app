import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OTPViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  NavigationService _navigationService = NavigationService();
  final _apiService = locator<HttpApiService>();
  static final _storage = locator<SharedPreferenceLocalStorage>();
  static String? _storedOTP;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  static init() {
    _storedOTP = _storage.getString(StorageKeys.otp);
    print('Retrieved OTP is $_storedOTP');
  }

  void _loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  void navigateLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  verifyOTP(context) async {
    _loading(true);
    final endpoint = '/verify-account';
    if (otpController.text.length > 5) {
      final verificationData = {
        'code': otpController.text,
      };
      if (_storedOTP == otpController.text) {
        final response =
            await _apiService.post(endpoint, data: verificationData);
        print(response?.data['status']);
        _loading(false);
        if (response?.statusCode == 200) {
          AppSnackBar.success(context, response?.data['message']);
          _storage.setBool(StorageKeys.registeredNotverifiedOTP, false);
          navigateLogin();
        } else {
          AppSnackBar.failure(
              context, response?.data['message'] ?? 'Something went wrong');
        }
      } else {
        _loading(false);
        AppSnackBar.failure(context, "Wrong OTP, please check again.");
      }
    }
  }
}
