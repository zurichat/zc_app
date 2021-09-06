import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/local_storage_services.dart';

class SplashscreenViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  init() {
    Timer(
      const Duration(seconds: 3),
      () {
        if (storage.getBool('onboarded') != true) {
          storage.setBool('onboarded', true);
          navigation.navigateTo(Routes.onboardingView);
        }
        navigation.navigateTo(Routes.loginView);
      },
    );
  }
}
