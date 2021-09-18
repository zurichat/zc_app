// ignore: file_names
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailConfirmationViewModel extends BaseViewModel {
  final snackbar = locator<SnackbarService>();

  void openEmailApp() {
    try {
      AppAvailability.launchApp(
              Platform.isIOS ? 'message://' : 'com.google.android.gm')
          .then((_) {
        print('App Email launched!');
      }).catchError((err) {
        // ignore: deprecated_member_use
        snackbar.showSnackbar(message: 'App Email not found!');
        print(err);
      });
    } catch (e) {
      // ignore: deprecated_member_use
      snackbar.showSnackbar(message: 'Email App not found');
    }
  }
}
