
// import 'package:flutter/material.dart';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
class LoginViewModel extends BaseViewModel {

  void navigateToHomeScreen() {
    locator<NavigationService>().navigateTo(Routes.homePage);
  }
  }

