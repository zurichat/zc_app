import 'dart:io';

import 'package:appcheck/appcheck.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../utilities/enums.dart';

class EmailConfirmationViewModel extends BaseViewModel {
  final log = getLogger('EmailConfirmationViewModel');
  final snackbar = locator<SnackbarService>();

  void openEmailApp() {
    try {
      AppCheck.launchApp(
              Platform.isIOS ? 'message://' : 'com.google.android.gm')
          .then((_) {
        log.i('App Email launched!');
      }).catchError((err) {
        snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.failure,
          message: EmailAppNotFound,
        );
        log.i(err);
      });
    } catch (e) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: EmailAppNotFound,
      );
    }
  }
}
