import 'package:flutter/material.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../package/base/server-request/api/http_api.dart';
import '../../../services/local_storage_services.dart';

class SignUpViewModel extends BaseViewModel {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController displayName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  final navigation = locator<NavigationService>();
  final apiService = locator<HttpApiService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final navigator = locator<NavigationService>();

  bool isLoading = false;
  bool checkBoxValue = false;

  void updateValue(newValue) {
    checkBoxValue = newValue;
    notifyListeners();
  }

  void loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToHome() => navigator.navigateTo(Routes.navBarView);
  void navigateToSignIn() => navigation.navigateTo(Routes.oTPView);
  void navigateToOTPView() => navigation.navigateTo(Routes.oTPView);

  // ignore: always_declare_return_types
  createUser(context) async {
    if (checkBoxValue == true) {
      loading(true);
      const endpoint = '/users';
      final signUpData = {
        'first_name': firstName.text,
        'last_name': lastName.text,
        'display_name': displayName.text,
        'email': email.text,
        'password': password.text,
        'phone': phoneNumber.text,
      };
      final response = await apiService.post(endpoint, data: signUpData);
      loading(false);
      if (response?.statusCode == 200) {
        AppSnackBar.success(
          context,
          'Please check your email for your one-time-password',
        );
        storage.setString(
            StorageKeys.otp, response?.data['data']['verification_code']);
        storage.setString(StorageKeys.currentUserEmail, email.text);
        navigateToOTPView();
      } else {
        AppSnackBar.failure(
          context,
          response?.data['message'] ?? 'Error encountered during signup.',
        );
      }
    } else {
      AppSnackBar.failure(context, 'You must accept T & C to signup');
    }
  }
}
