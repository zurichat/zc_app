// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String NewPasswordValueKey = 'newPassword';
const String ConfirmPasswordValueKey = 'confirmPassword';

mixin $ForgotPasswordNewView on StatelessWidget {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    newPasswordController.addListener(() => _updateFormData(model));
    confirmPasswordController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            NewPasswordValueKey: newPasswordController.text,
            ConfirmPasswordValueKey: confirmPasswordController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get newPasswordValue => formValueMap[NewPasswordValueKey];
  String? get confirmPasswordValue =>
      formValueMap[ConfirmPasswordValueKey];

  bool get hasNewPassword => formValueMap.containsKey(NewPasswordValueKey);
  bool get hasConfirmPassword =>
      formValueMap.containsKey(ConfirmPasswordValueKey);
}

extension Methods on FormViewModel {}
