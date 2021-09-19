import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordOtpViewModel extends FormViewModel {
  NavigationService _navigationService = NavigationService();

  void navigateToNewPassword() {
    _navigationService.navigateTo(Routes.forgotPasswordNewView);
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
