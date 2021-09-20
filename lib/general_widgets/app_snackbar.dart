import 'package:flutter/material.dart';

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
