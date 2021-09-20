import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();

  navigateToNext() {
    navigator.navigateTo(Routes.signUpView);
  }

  final PageController? controller = PageController();

  void animateToPage(int index) {
    switch (index) {
      case 0:
        controller?.animateToPage(1,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
        break;
      case 1:
        controller?.animateToPage(2,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
        break;
      default:
    }
    notifyListeners();
  }
}
