import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/forgot_password/forgot_password_email/forgot_password_email_view.form.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/mixins/validators_mixin.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordEmailViewModel extends FormViewModel with ValidatorMixin {
  bool inputError = false;
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _apiService = ZuriApi(baseUrl: coreBaseUrl);
   final storageService = locator<SharedPreferenceLocalStorage>();
  bool isLoading = false;
   String? get token => storageService.getString(StorageKeys.currentSessionToken);

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  Future validateEmailIsRegistered() async {
    loading(true);
    const endpoint = 'account/request-password-reset-code';
    if (forgotEmailValue == '') {
      loading(false);
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 2),
        variant: SnackbarType.failure,
        message: 'Please fill all fields.',
      );
      return;
    } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_"
            r"`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(forgotEmailValue!)) {
      loading(true);
    } else {
      loading(false);
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 2),
        variant: SnackbarType.failure,
        message: 'Invalid email format',
      );
      return;
    }

    final validationData = {'email': forgotEmailValue};
    final response = await _apiService.post(endpoint, body: validationData, token: token);
    response != null ? loading(false) : loading(true);

    if (response?.statusCode == 200) {
      _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 2),
          variant: SnackbarType.success,
          message: 'Please check your email for your one-time password');

      navigateToForgotPasswordOtpView();
    } else {
      _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 2),
          variant: SnackbarType.failure,
          message: response?.data['message'] ?? 'An Error Occurred.');
    }
  }

  @override
  void setFormStatus() {}

  void navigateToForgotPasswordOtpView() =>
      _navigationService.navigateTo(Routes.forgotPasswordOtpView);

  void navigateToSignIn() => _navigationService.navigateTo(Routes.loginView);
}
