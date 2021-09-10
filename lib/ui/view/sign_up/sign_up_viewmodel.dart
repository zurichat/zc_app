import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  bool checkBoxValue = false;
  final navigator = locator<NavigationService>();

  void updateValue(newValue) {
    checkBoxValue = newValue;
    notifyListeners();
  }

  void navigateToHome() => navigator.navigateTo(Routes.navBarView);
  navigateToSignIn() {
    navigation.navigateTo(Routes.loginView);
  }
}
