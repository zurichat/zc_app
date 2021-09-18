import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/sign_up/sign_up_view.form.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends FormViewModel {
  final navigation = locator<NavigationService>();
  final apiService = locator<HttpApiService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final navigator = locator<NavigationService>();

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
      final response = await apiService.post(endpoint, data: signUpData);
      loading(false);
      if (response?.statusCode == 200) {
        AppSnackBar.success(
          context,
          'Please check your email for your one-time-password',
        );
        storage.setString(
            StorageKeys.otp, response?.data['data']['verification_code']);
        storage.setString(StorageKeys.currentUserEmail, emailValue!);
        storage.setBool(StorageKeys.registeredNotverifiedOTP, true);
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
