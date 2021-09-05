import 'dart:async';

import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SplashscreenViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  init() {
    Timer(const Duration(seconds: 3), () {
      navigation.navigateTo(Routes.onboardingView);
    });
  }
}
