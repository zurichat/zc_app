import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/constants/app_strings.dart';
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
  final _apiService = ZuriApi(coreBaseUrl);
  final snackbar = locator<SnackbarService>();
  bool isLoading = false;
      final storageService = locator<SharedPreferenceLocalStorage>();
   String? get token => storageService.getString(StorageKeys.currentSessionToken);

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

    if (newPasswordValue == '' || confirmPasswordValue == '') {
      loading(false);
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: FillAllFields,
      );
      return;
    } else if (newPasswordValue != confirmPasswordValue) {
      loading(false);
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: PasswordsMustMatch,
      );
      return;
    }

    final newPasswordData = {
      'password': newPasswordValue,
      'confirm_password': confirmPasswordValue
    };
    //TODO - CONFIRM ENDPOINT - should be a patch req
    final response =
        await _apiService.post(ResetPasswordEndpoint, body: newPasswordData, token: token);
    loading(false);
    if (response?.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: PasswordUpdated,
      );
      navigateToLogin();
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: response?.data['message'] ?? PasswordNotUpdated,
      );
    }
  }

  @override
  void setFormStatus() {}
}
