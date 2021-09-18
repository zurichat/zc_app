import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/login/login_view.form.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final _apiService = locator<HttpApiService>();

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
    if (emailValue == '' || passwordValue == '') {
      loading(false);
      //Hides the keyboard for the failure snackbar to be visible
      // FocusScope.of(context).unfocus();
      AppSnackBar.failure(context, 'Please fill all fields.');
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
      AppSnackBar.success(
        context,
        ' ${response?.data['message']} for ${response?.data['data']['user']['email']}',
      );
      navigationService.navigateTo(Routes.navBarView);
    } else {
      AppSnackBar.failure(context,
          response?.data['message'] ?? 'Error encountered during login.');
    }
  }

  @override
  void setFormStatus() {}
}
