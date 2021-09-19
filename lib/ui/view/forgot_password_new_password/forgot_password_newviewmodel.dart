import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordNewViewModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService();
  final _apiService = locator<HttpApiService>();

  final TextEditingController pwdController = TextEditingController(),
      confirmPwdController = TextEditingController();

  bool isLoading = false;

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToLogin() => _navigationService.navigateTo(Routes.loginView);

  Future resetPassword(context) async {
    loading(true);
    const endpoint = '/account/update-password/440241';
    if (pwdController.text == '' || confirmPwdController.text == '') {
      loading(false);
      AppSnackBar.failure(context, 'Please fill all fields.');
      return;
    } else if (pwdController.text == confirmPwdController.text) {
      loading(false);
      AppSnackBar.failure(context, 'Passwords must match!');
      return;
    }

    final newPasswordData = {
      'password': pwdController.text,
      'confirm_password': confirmPwdController.text
    };
    final response = await _apiService.post(endpoint, data: newPasswordData);
    loading(false);
    if (response?.statusCode == 200) {
      AppSnackBar.success(
        context,
        '''Password successfully updated.''',
      );
      navigateToLogin();
    } else {
      AppSnackBar.failure(context,
          response?.data['message'] ?? 'Password could not be updated.');
    }
  }
}
