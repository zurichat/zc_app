// ignore: file_names
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:stacked/stacked.dart';

class EmailConfirmationViewModel extends BaseViewModel {
  // ignore: unused_element
  void openEmailApp(BuildContext context) {
    try {
      AppAvailability.launchApp(
              Platform.isIOS ? 'message://' : 'com.google.android.gm')
          .then((_) {
        print('App Email launched!');
      }).catchError((err) {
        // ignore: deprecated_member_use
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('App Email not found!'),
          ),
        );
        print(err);
      });
    } catch (e) {
      // ignore: deprecated_member_use
      Scaffold.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email App not found!'),
        ),
      );
    }
  }
}
