import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/constants/app_strings.dart';
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
  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  Future validateEmailIsRegistered() async {
    loading(true);

    if (forgotEmailValue == '') {
      loading(false);
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 2),
        variant: SnackbarType.failure,
        message: FillAllFields,
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
        message: InvalidEmailFormat,
      );
      return;
    }

    final validationData = {'email': forgotEmailValue};
    final response = await _apiService.post(RequestOTPEndpoint,
        body: validationData, token: token);

    response != null ? loading(false) : loading(true);

    if (response?.statusCode == 200) {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 2),
        variant: SnackbarType.success,
        message: CheckEmailForOTP,
      );

      navigateToForgotPasswordOtpView();
    } else {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 2),
        variant: SnackbarType.failure,
        message: response?.data['message'] ?? ErrorOccurred,
      );
    }
  }

  @override
  void setFormStatus() {}

  void navigateToForgotPasswordOtpView() =>
      _navigationService.navigateTo(Routes.forgotPasswordOtpView);

  void navigateToSignIn() => _navigationService.navigateTo(Routes.loginView);
}
