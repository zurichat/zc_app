import 'dart:async';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../package/base/server-request/api/http_api.dart';
import '../../../../utilities/enums.dart';
import '../../../shared/shared.dart';
import '../../otp/otp_view.form.dart';

class ForgotPasswordOtpViewModel extends FormViewModel {
  NavigationService _navigationService = NavigationService();
  final _apiService = HttpApiService(coreBaseUrl);
  final snackbar = locator<SnackbarService>();
  bool isLoading = false;

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToNewPassword() {
    _navigationService.navigateTo(Routes.forgotPasswordNewView);
  }

  Future verifyOtpCode() async {
    loading(true);
    const endpoint = '/account/verify-reset-password';
    if (otpValue == '') {
      loading(false);
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: 'Please Fill in all fields');
      return;
    }
    final validationData = {'code': otpValue};
    final response = await _apiService.post(endpoint, data: validationData);
    loading(false);
    navigateToNewPassword();
    if (response?.statusCode == 200) {
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: '''Password reset. Enter a new one.''');
      navigateToNewPassword();
    } else {
      // AppSnackBar.failure(
      //     context,response?.data['message'] ?? 'OTP could not be validated.' );
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: response?.data['message'] ?? 'OTP could not be validated.');
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}