import 'package:flutter/material.dart';

import 'package:hng/ui/shared/colors.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:stacked_services/stacked_services.dart';

// enum SnackBarType { Success, Failure }

setUpSnackBarUi() {
  final snackBarService = locator<SnackbarService>();
  snackBarService.registerSnackbarConfig(SnackbarConfig(
    margin: EdgeInsets.only(bottom: 0, right: 0, left: 0),
    barBlur: 0.6,
    borderRadius:0,
    messageColor: AppColors.whiteColor,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    backgroundColor: Colors.black.withOpacity(0.6),
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
        backgroundColor: AppColors.zuriPrimaryColor,
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> failure(
      context, text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text(text),
        backgroundColor: AppColors.redColor,
      ),
    );
  }
}
