import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/shared/shared.dart';
import 'package:hng/ui/view/login/login_view.form.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _snackbarService = locator<SnackbarService>();
  final _apiService = HttpApiService(coreBaseUrl);
  final _connectivityService = locator<ConnectivityService>();

  bool isLoading = false;

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  void navigateToHomeScreen() {
    _navigationService.navigateTo(Routes.navBarView);
  }

  void navigateToSignUpScreen() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  void navigateToForgotPasswordScreen() {
    _navigationService.navigateTo(Routes.forgotPasswordEmailView);
  }

  // ignore: always_declare_return_types
  Future logInUser() async {
    var connected = await _connectivityService.checkConnection();
    if (!connected) {
      _snackbarService.showCustomSnackBar(
        message: 'No internet connection, connect and try again.',
        variant: SnackbarType.failure,
        duration: Duration(milliseconds: 1500),
      );
      return;
    }
    loading(true);
    const endpoint = '/auth/login';
    if (emailValue == null || passwordValue == null) {
      loading(false);
      _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 1500),
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
      _storageService.setString(
        StorageKeys.currentSessionToken,
        response?.data['data']['user']['token'],
      );
      _storageService.setString(
        StorageKeys.currentUserId,
        response?.data['data']['user']['id'],
      );
      _storageService.setString(
        StorageKeys.currentUserEmail,
        response?.data['data']['user']['email'],
      );
      _storageService.clearData(StorageKeys.organizationIds);
      // final userModel = UserModel.fromJson(response?.data['data']['user']);

      _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 1500),
        variant: SnackbarType.success,
        message: ''' ${response?.data['message']} for'''
            ''' ${response?.data['data']['user']['email']}''',
      );

      //Todo check if user has currently joined an Organization
      _navigationService.navigateTo(Routes.organizationView);
    } else {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 1500),
        variant: SnackbarType.failure,
        message: response?.data['message'] ?? 'Error encountered during login.',
      );
    }
  }

  @override
  void setFormStatus() {}
}
