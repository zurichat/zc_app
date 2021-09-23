import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/utilities/enums.dart';
import 'forgot_password_email_view.form.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:hng/utilities/mixins/validators_mixin.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordEmailViewModel extends FormViewModel with ValidatorMixin {
  bool inputError = false;
  final navigationService = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final _apiService = HttpApiService(coreBaseUrl);
  bool _isLoading = false;

  loading(status) {
    _isLoading = status;
    notifyListeners();
  }

  // submitEmail() {
  //   loading(true);
  //   _emailValidation();
  //   notifyListeners();
  // }

  // void _emailValidation() {
  //   bool validateEmail = emailValidation(forgotEmailValue!);
  //   if (validateEmail) {
  //     inputError = !validateEmail;
  //     navigateToforgotPasswordOtpView();
  //   } else {
  //     inputError = !validateEmail;
  //     print('$inputError');
  //   }
  // }

  Future validateEmailIsRegistered() async {
    loading(true);
    const endpoint = '/verify/account';
    if (forgotEmailValue == '') {
      loading(false);
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
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
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Invalid email format',
      );
      return;
    }

    final validationData = {'email': forgotEmailValue};
    final response = await _apiService.post(endpoint, data: validationData);
    // TODO: Use correct API endpoint to check if user exists and report
    //  appropriate feedback.
    loading(false);

    _requestOtp();
  }

  Future _requestOtp() async {
    loading(true);
    const endpoint = 'account/request-password-reset-code';
    final validationData = {'email': forgotEmailValue};
    final response = await _apiService.post(endpoint, data: validationData);
    response != null ? loading(false) : loading(true);

    if (response?.statusCode == 200) {
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message:
              '''User registered on ZuriChat. Password reset code requested.''');

      navigateToforgotPasswordOtpView();
    } else {
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: 'No user is registered with the e-mail you provided.');
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  void navigateToforgotPasswordOtpView() =>
      navigationService.navigateTo(Routes.forgotPasswordOtpView);

  void navigateToSignIn() => navigationService.navigateTo(Routes.loginView);
}
