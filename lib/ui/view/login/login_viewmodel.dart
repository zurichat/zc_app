import 'package:flutter/widgets.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/local_storage_services.dart';

import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/login/login_view.form.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final snackbar = locator<SnackbarService>();
  final _apiService = HttpApiService(coreBaseUrl);
  bool isLoading = false;
  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToHomeScreen() {
    navigationService.navigateTo(Routes.navBarView);
  }

  void navigateToSignUpScreen() {
    navigationService.navigateTo(Routes.signUpView);
  }

  void navigateToForgotPasswordScreen(BuildContext context) {
    navigationService.navigateTo(Routes.forgotPasswordEmailView);
  }

  // ignore: always_declare_return_types
  Future logInUser(context) async {
    loading(true);
    const endpoint = '/auth/login';
    if (emailValue == null || passwordValue == null) {
      loading(false);
      //Hides the keyboard for the failure snackbar to be visible
      // FocusScope.of(context).unfocus();
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Please fill all fields.',
      );

      return;
    }
    final loginData = {'email': emailValue, 'password': passwordValue};
    final response = await _apiService.post(endpoint, data: loginData);
    loading(false);

    //saving user details to storage on request success
    if (response?.statusCode == 200) {
      storage.setString(
        StorageKeys.currentSessionToken,
        response?.data['data']['user']['token'],
      );
      storage.setString(
        StorageKeys.currentUserId,
        response?.data['data']['user']['id'],
      );
      storage.setString(
        StorageKeys.currentUserEmail,
        response?.data['data']['user']['email'],
      );
      storage.clearData(StorageKeys.organizationIds);
      // final userModel = UserModel.fromJson(response?.data['data']['user']);

      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: ''' ${response?.data['message']} for'''
            ''' ${response?.data['data']['user']['email']}''',
      );

      //Todo check if user has currently joined an Organization
      navigationService.navigateTo(Routes.organizationView);
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: response?.data['message'] ?? 'Error encountered during login.',
      );
    }
  }

  @override
  void setFormStatus() {}
}
