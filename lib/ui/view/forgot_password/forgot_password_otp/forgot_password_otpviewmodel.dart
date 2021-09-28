import 'dart:async';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/otp/otp_view.form.dart';
import 'package:hng/utilities/enums.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordOtpViewModel extends FormViewModel {
  NavigationService _navigationService = NavigationService();
  final _apiService = HttpApiService(coreBaseUrl);
  final _snackbarService = locator<SnackbarService>();
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
      _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: 'Please Fill in all fields');
      return;
    }
    notifyListeners();

    final validationData = {'code': otpValue};
    final response = await _apiService.post(endpoint, data: validationData);
    loading(false);
    if (response?.statusCode == 200) {
      _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 2),
          variant: SnackbarType.success,
          message: 'Please enter a new password');
      navigateToNewPassword();
    } else {
      _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 2),
          variant: SnackbarType.failure,
          message: response?.data['message'] ?? 'OTP could not be validated.');
    }
  }

  @override
  void setFormStatus() {}
}
