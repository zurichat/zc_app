import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hng/app/app.router.dart';

class LoginViewModel extends BaseViewModel {
  NavigationService _navigationService = NavigationService();

  void navigateToHomeScreen() {
    _navigationService.navigateTo(Routes.navBarView);
  }

  void navigateToSignUpScreen() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  void navigateToForgotPasswordScreen() {
    _navigationService.navigateTo(Routes.forgotPasswordView);
  }
}
