import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/google_signin_api.dart';
import 'package:hng/ui/view/organization/organization_view/organization_view.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/local_storage_services.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/storage_keys.dart';
import 'sign_up_view.form.dart';

class SignUpViewModel extends FormViewModel {
  final navigation = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final navigator = locator<NavigationService>();
  final _connectivityService = locator<ConnectivityService>();
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

  Future signUpGoogle(context) async {
    final user = await GoogleSignInApi.login();

    var connected = await _connectivityService.checkConnection();
    if (!connected) {
      snackbar.showCustomSnackBar(
        message: noInternet,
        variant: SnackbarType.failure,
        duration: const Duration(milliseconds: 1500),
      );
      return;
    }
    loading(true);

    if (user == null) {
      loading(true);
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: FailedGoogleSignIn,
      );
    } else {
      final signUpGoogleData = {
        'email': user.email,
        'photo': user.photoUrl,
        'display_name': user.displayName,
      };

      final response = await zuriApi.post(signUpEndpoint,
          body: signUpGoogleData, token: token);
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
        storage.clearData(StorageKeys.currentOrgId);

        snackbar.showCustomSnackBar(
          duration: const Duration(milliseconds: 1500),
          variant: SnackbarType.success,
          message: ''' ${response?.data['message']} for'''
              ''' ${response?.data['data']['user']['email']}''',
        );

        navigation.navigateToView(OrganizationView(user: user));
      }
    }
  }
}
