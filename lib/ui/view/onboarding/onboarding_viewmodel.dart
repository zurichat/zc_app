import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  navigateToNext() {
    navigator.navigateTo(Routes.signUpView);
  }
}
