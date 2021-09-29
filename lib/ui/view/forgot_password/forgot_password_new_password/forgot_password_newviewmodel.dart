import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/mixins/validators_mixin.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'forgot_password_newview.form.dart';

class ForgotPasswordNewViewModel extends FormViewModel with ValidatorMixin {
  bool inputError = false;
  NavigationService _navigationService = NavigationService();
  final _apiService = ZuriApi(baseUrl: coreBaseUrl);
  // final _otpService = locator<OtpService>();
  final snackbar = locator<SnackbarService>();
     final storageService = locator<SharedPreferenceLocalStorage>();
   String? get token => storageService.getString(StorageKeys.currentSessionToken);
  bool isLoading = false;

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }

  void passwordVerification() {
    _passwordValidation();
    notifyListeners();
  }

  void _passwordValidation() {
    bool validatePassword = passValidation(newPasswordValue!);
    if (validatePassword) {
      inputError = !validatePassword;
      navigateToLogin();
    } else {
      inputError = !validatePassword;
      print('$inputError');
    }
  }

  Future resetPassword() async {
    loading(true);
    //TODO - wrong endpoint
    final endpoint = '/account/update-password/';
    if (newPasswordValue == '' || confirmPasswordValue == '') {
      loading(false);
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Please fill all fields.',
      );
      return;
    } else if (newPasswordValue != confirmPasswordValue) {
      loading(false);
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Passwords must match',
      );
      return;
    }

    final newPasswordData = {
      'password': newPasswordValue,
      'confirm_password': confirmPasswordValue
    };
    //should be a patch req
    final response = await _apiService.post(endpoint, body: newPasswordData, token: token);
    loading(false);
    if (response?.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: 'Password Successfully Updated',
      );
      navigateToLogin();
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: response?.data['message'] ?? 'Password could not be updated.',
      );
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  // method to get the OTP into this ViewModel from {@link ForgotPasswordOtpViewModel}
  // String get otp => _otpService.otp;
}
