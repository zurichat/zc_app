// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String OtpValueKey = 'otp';

mixin $ForgotPasswordOtpView on StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    otpController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            OtpValueKey: otpController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    otpController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get otpValue => this.formValueMap[OtpValueKey];

  bool get hasOtp => this.formValueMap.containsKey(OtpValueKey);
}

extension Methods on FormViewModel {}
