import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/api_handlers/zuri_api.dart';
import 'package:zurichat/utilities/constants/app_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/app_services/local_storage_services.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/constants/storage_keys.dart';
import 'sign_up_view.form.dart';

class SignUpViewModel extends FormViewModel {
  final navigation = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final navigator = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();
  final zuriApi = ZuriApi(coreBaseUrl);

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
  void navigateToTermsAndConditions() =>
      navigator.navigateTo(Routes.termsAndConditionsView);

  createUser() async {
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

      final response =
          await zuriApi.post(signUpEndpoint, body: signUpData, token: token);
      loading(false);
      if (response?.statusCode == 200) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: checkEmailForOTP,
        );

        storage.setString(
            StorageKeys.otp, response?.data['data']['verification_code']);
        storage.setString(StorageKeys.currentUserEmail, emailValue!);
        storage.setBool(StorageKeys.registeredNotverifiedOTP, true);
        navigateToOTPView();
      }
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: acceptTnC,
      );
    }
  }
}
