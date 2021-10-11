import 'dart:async';

import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../services/local_storage_services.dart';

class SplashscreenViewModel extends BaseViewModel {
  final navigation = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  init() {
    // storage.clearStorage();
    Timer(
      const Duration(seconds: 1),
      () {
        //TODO comment it out to get access to once only view
        if (storage.getBool('onboarded') == null ||
            storage.getBool('onboarded') == false) {
          storage.setBool('onboarded', true);
          navigation.navigateTo(Routes.onboardingView);
        } else if (storage.getBool(StorageKeys.registeredNotverifiedOTP) ==
            true) {
          navigation.navigateTo(Routes.oTPView);
        } else if (storage.getString(StorageKeys.currentUserId) == null) {
          navigation.navigateTo(Routes.loginView);
        } else {
          if (storage.getString(StorageKeys.currentOrgId) == null ||
              storage.getString(StorageKeys.currentOrgId) == '') {
            navigation.navigateTo(Routes.organizationView);
          } else {
            navigation.navigateTo(Routes.navBarView);
          }
        }
        // navigation.navigateTo(Routes.onboardingView);
      },
    );
  }
}
