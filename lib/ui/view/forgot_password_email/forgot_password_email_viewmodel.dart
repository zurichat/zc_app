import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordEmailViewModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService();
  final _apiService = locator<HttpApiService>();

  TextEditingController email = TextEditingController();

  bool isLoading = false;

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToOtp() {
    _navigationService.navigateTo(Routes.forgotPasswordOtpView);
  }

  Future validateEmailIsRegistered(context) async {
    loading(true);
    const endpoint = '/verify/account';
    if (email.text == '') {
      loading(false);
      AppSnackBar.failure(context, 'Please fill all fields.');
      return;
    }
    final validationData = {'email': email.text};
    final response = await _apiService.post(endpoint, data: validationData);
    loading(false);

    _requestOtp();
    navigateToOtp();
    // if (response?.statusCode == 200) {
    //   AppSnackBar.success(
    //     context,
    //     '''User registered on ZuriChat. Password reset code requested.''',
    //   );
    //   navigateToOtp();
    // } else {
    //   AppSnackBar.failure(
    //       context, 'No user is registered with the e-mail you provided.');
    // }
  }

  Future _requestOtp() async {
    loading(true);
    const endpoint = 'account/request-password-reset-code';
    final validationData = {'email': email.text};
    final response = await _apiService.post(endpoint, data: validationData);
    response != null ? loading(false) : loading(true);
  }
}
