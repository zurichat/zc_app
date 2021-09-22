// ignore: file_names
import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:hng/app/app.logger.dart';
import '../../../../app/app.locator.dart';
import '../../../../utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EmailConfirmationViewModel extends BaseViewModel {
  final log = getLogger('EmailConfirmationViewModel');
  final snackbar = locator<SnackbarService>();

  void openEmailApp() {
    try {
      AppAvailability.launchApp(
              Platform.isIOS ? 'message://' : 'com.google.android.gm')
          .then((_) {
        log.i('App Email launched!');
      }).catchError((err) {
        // ignore: deprecated_member_use
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: 'App Email not found!',
        );
        log.i(err);
      });
    } catch (e) {
      // ignore: deprecated_member_use
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Email App not found',
      );
    }
  }
}
