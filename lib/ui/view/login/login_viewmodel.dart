import 'package:hng/ui/shared/shared.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../package/base/server-request/api/http_api.dart';
import '../../../services/local_storage_services.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/storage_keys.dart';
import 'login_view.form.dart';

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
    navigationService.navigateTo(Routes.workspaceView);
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
    if (emailValue == '' || passwordValue == '') {
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
      storage.clearData(StorageKeys.workspaceIds);
      // final userModel = UserModel.fromJson(response?.data['data']['user']);

      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: ''' ${response?.data['message']} for'''
            ''' ${response?.data['data']['user']['email']}''',
      );

      //Todo check if user has currently joined an organisation
      navigationService.navigateTo(Routes.workspaceView);
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
