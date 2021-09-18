// ignore: file_names
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:hng/general_widgets/app_snackbar.dart';
import 'package:stacked/stacked.dart';

class EmailConfirmationViewModel extends BaseViewModel {
  // ignore: unused_element
  void openEmailApp(context) {
    try {
      AppAvailability.launchApp(
              Platform.isIOS ? 'message://' : 'com.google.android.gm')
          .then((_) {
        print('App Email launched!');
      }).catchError((err) {
        // ignore: deprecated_member_use
        AppSnackBar.success(context,'App Email not found!');
        print(err);
      });
    } catch (e) {
      // ignore: deprecated_member_use
      AppSnackBar.success(context,'Email App not found');
    }
  }
}
