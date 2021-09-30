import 'package:hng/app/app.logger.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/connectivity_service.dart';
import '../../../services/local_storage_services.dart';
import '../../../utilities/enums.dart';
import '../../../utilities/storage_keys.dart';
import '../../shared/shared.dart';
import 'login_view.form.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();
  final _snackbarService = locator<SnackbarService>();
  final _apiService = ZuriApi(baseUrl: coreBaseUrl);
  final _connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final _userService = locator<UserService>();

  final log = getLogger('LogInViewModel');

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  bool isLoading = false;

  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  Future initialise() async {
    var hasUser = _userService.hasUser;
    return hasUser;
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
        message: noInternet,
        variant: SnackbarType.failure,
        duration: Duration(milliseconds: 1500),
      );
      return;
    }
    loading(true);

    if (emailValue == null ||
        passwordValue == null ||
        emailValue == '' ||
        passwordValue == '') {
      loading(false);
      _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 1500),
        variant: SnackbarType.failure,
        message: fillAllFields,
      );

      return;
    }
    final loginData = {'email': emailValue, 'password': passwordValue};
    final response =
        await _apiService.post(loginEndpoint, body: loginData, token: token);

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
      _storageService.clearData(StorageKeys.currentOrgId);
      // final userModel = UserModel.fromJson(response?.data['data']['user']);

      _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 1500),
        variant: SnackbarType.success,
        message: ''' ${response?.data['message']} for'''
            ''' ${response?.data['data']['user']['email']}''',
      );

      //Todo check if user has currently joined an Organization
      _navigationService.pushNamedAndRemoveUntil(Routes.organizationView);
    } else {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(milliseconds: 1500),
        variant: SnackbarType.failure,
        message: response?.data['message'] ?? errorEncounteredLogin,
      );
    }
  }

  @override
  void setFormStatus() {}
}
