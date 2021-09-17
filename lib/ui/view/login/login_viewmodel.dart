import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../general_widgets/app_snackbar.dart';
import '../../../package/base/server-request/api/http_api.dart';
import '../../../services/local_storage_services.dart';
import '../../../utilities/storage_keys.dart';

class LoginViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final _apiService = locator<HttpApiService>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  double height = 0;
  double width = 0;
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

  void navigateToForgotPasswordScreen() {
    navigationService.navigateTo(Routes.forgotPasswordEmailView);
  }

  // ignore: always_declare_return_types
  Future logInUser(context) async {
    loading(true);
    const endpoint = '/auth/login';
    if (email.text == '' || password.text == '') {
      loading(false);
      AppSnackBar.failure(context, 'Please fill all fields.');
      return;
    }
    final loginData = {'email': email.text, 'password': password.text};
    final response = await _apiService.post(endpoint, data: loginData);
    loading(false);
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
      // final userModel = UserModel.fromJson(response?.data['data']['user']);
      AppSnackBar.success(
        context,
        ''' ${response?.data['message']} for '''
        '''${response?.data['data']['user']['email']}''',
      );
      navigationService.navigateTo(Routes.navBarView);
    } else {
      AppSnackBar.failure(context,
          response?.data['message'] ?? 'Error encountered during login.');
    }
  }
}
