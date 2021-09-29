<<<<<<< HEAD
=======
import 'package:hng/constants/app_strings.dart';
>>>>>>> 6ac6c85e6c499e4ce561dab8d84b37a74fd447f6
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
<<<<<<< HEAD
   String? get token => storage.getString(StorageKeys.currentSessionToken);
=======
  String? get token => storage.getString(StorageKeys.currentSessionToken);
>>>>>>> 6ac6c85e6c499e4ce561dab8d84b37a74fd447f6

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

      final signUpData = {
        'first_name': firstNameValue,
        'last_name': lastNameValue,
        'display_name': displayNameValue,
        'email': emailValue,
        'password': passwordValue,
        'phone': phoneNumberValue,
      };
<<<<<<< HEAD
      final response = await apiService.post(endpoint, body: signUpData, token: token);
=======
      final response = await apiService.post(
        SignUpEndpoint,
        body: signUpData,
      );
>>>>>>> 6ac6c85e6c499e4ce561dab8d84b37a74fd447f6
      loading(false);
      if (response?.statusCode == 200) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: CheckEmailForOTP,
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
          message: response?.data['message'] ?? ErrorEncounteredSignUp,
        );
      }
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: AcceptTnC,
      );
    }
  }
}
