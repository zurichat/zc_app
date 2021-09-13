import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordNewViewModel extends BaseViewModel {
  NavigationService _navigationService = NavigationService();

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
