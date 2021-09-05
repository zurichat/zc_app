<<<<<<< HEAD
// import 'package:flutter/material.dart';
=======

// import 'package:flutter/material.dart';

import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
>>>>>>> 2738e2335b98f6a7c501a35afe04e3cf28f6a9d9
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
class LoginViewModel extends BaseViewModel {

  void navigateToHomeScreen() {
    locator<NavigationService>().navigateTo(Routes.homePage);
  }
  }

