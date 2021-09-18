import 'package:flutter/material.dart';
import 'package:hng/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

// enum SnackBarType { Success, Failure }

setUpSnackBarUi() {
  final snackBarService = locator<SnackbarService>();
  snackBarService.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: Colors.black.withOpacity(0.8),
    textColor: Colors.white,
    animationDuration: const Duration(seconds: 3),
  ));
}

class AppSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> success(
      context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(text),
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> failure(
      context, text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(text),
      ),
    );
  }
}
