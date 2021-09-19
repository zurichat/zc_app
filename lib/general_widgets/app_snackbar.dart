import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../ui/shared/colors.dart';
import '../utilities/enums.dart';

// enum SnackBarType { Success, Failure }

class AppSnackBar {
  static void setupSnackbarUi() {
    final service = locator<SnackbarService>();

    service.registerCustomSnackbarConfig(
      variant: SnackbarType.success,
      config: SnackbarConfig(
        backgroundColor: AppColors.zuriPrimaryColor,
        textColor: AppColors.whiteColor,
        borderRadius: 1,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        // animationDuration: const Duration(seconds: 3),
        margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
        barBlur: 0.6,
        messageColor: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      ),
    );

    service.registerCustomSnackbarConfig(
      variant: SnackbarType.failure,
      config: SnackbarConfig(
        backgroundColor: AppColors.redColor.withOpacity(0.6),
        textColor: AppColors.whiteColor,
        borderRadius: 1,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        // animationDuration: const Duration(seconds: 3),
        margin: const EdgeInsets.only(bottom: 0, right: 0, left: 0),
        barBlur: 0.6,
        messageColor: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
      ),
    );
  }
}
