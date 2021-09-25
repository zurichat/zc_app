import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../package/base/server-request/api/http_api.dart';
import '../../../../utilities/enums.dart';
import '../../../../utilities/mixins/validators_mixin.dart';
import '../../../shared/shared.dart';
import 'forgot_password_newview.form.dart';

class ForgotPasswordNewViewModel extends FormViewModel with ValidatorMixin {
  bool inputError = false;
  NavigationService _navigationService = NavigationService();
  final _apiService = HttpApiService(coreBaseUrl);
  final snackbar = locator<SnackbarService>();
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
    const endpoint = '/account/update-password/440241';
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
    final response = await _apiService.post(endpoint, data: newPasswordData);
    loading(false);
    if (response?.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: 'Password Successfully Updated',
      );
      navigateToLogin();
    } else {
      // AppSnackBar.failure(context,
      //     response?.data['message'] ?? 'Password could not be updated.');
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
}