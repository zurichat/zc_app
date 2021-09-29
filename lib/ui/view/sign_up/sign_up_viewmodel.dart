import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/local_storage_services.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/storage_keys.dart';
import '../../shared/shared.dart';
import 'sign_up_view.form.dart';

class SignUpViewModel extends FormViewModel {
  final navigation = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final navigator = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final apiService = ZuriApi(baseUrl: coreBaseUrl);
   String? get token => storage.getString(StorageKeys.currentSessionToken);

  bool isLoading = false;
  bool checkBoxValue = false;

  @override
  void setFormStatus() {}

  void updateValue(newValue) {
    checkBoxValue = newValue;
    notifyListeners();
  }

  void loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToHome() => navigator.navigateTo(Routes.navBarView);
  void navigateToSignIn() => navigation.navigateTo(Routes.loginView);
  void navigateToOTPView() => navigation.navigateTo(Routes.oTPView);

  // ignore: always_declare_return_types
  createUser(context) async {
    if (checkBoxValue == true) {
      loading(true);
      const endpoint = '/users';
      final signUpData = {
        'first_name': firstNameValue,
        'last_name': lastNameValue,
        'display_name': displayNameValue,
        'email': emailValue,
        'password': passwordValue,
        'phone': phoneNumberValue,
      };
      final response = await apiService.post(endpoint, body: signUpData, token: token);
      loading(false);
      if (response?.statusCode == 200) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: 'Please check your email for your one-time-password',
        );

        storage.setString(
            StorageKeys.otp, response?.data['data']['verification_code']);
        storage.setString(StorageKeys.currentUserEmail, emailValue!);
        storage.setBool(StorageKeys.registeredNotverifiedOTP, true);
        navigateToOTPView();
      } else {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message:
              response?.data['message'] ?? 'Error encountered during signup.',
        );
      }
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'You must accept T & C to signup',
      );
    }
  }
}
