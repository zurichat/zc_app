import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final navigator = locator<NavigationService>();
  int currentIndex = 0;

  navigateToNext() {
    navigator.navigateTo(Routes.signUpView);
  }

  final PageController? controller = PageController();

  void animateToPage(int index) {
    
        controller?.animateToPage(index+1,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
     
    notifyListeners();
  }

  void setCurrentIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
