import 'dart:async';

import 'package:zurichat/utilities/storage_keys.dart';
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
      const Duration(seconds: 1),
      () {
        if (storage.getBool('onboarded') == null ||
            storage.getBool('onboarded') == false) {
          storage.setBool('onboarded', true);
          navigation.clearStackAndShow(Routes.onboardingView);
        } else if (storage.getBool(StorageKeys.registeredNotverifiedOTP) ==
            true) {
          navigation.clearStackAndShow(Routes.oTPView);
        } else if (storage.getString(StorageKeys.currentUserId) != null) {
          navigation.clearStackAndShow(Routes.navBarView);
        } else {
          if (storage.getString(StorageKeys.currentOrgId) == null ||
              storage.getString(StorageKeys.currentOrgId) == '') {
            navigation.clearStackAndShow(Routes.loginView);
          } else {
            navigation.clearStackAndShow(Routes.signUpView);
          }
        }
      },
    );
  }
}
