// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String NewPasswordValueKey = 'newPassword';
const String ConfirmPasswordValueKey = 'confirmPassword';

final Map<String, TextEditingController>
    _ForgotPasswordNewViewTextEditingControllers = {};

final Map<String, FocusNode> _ForgotPasswordNewViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ForgotPasswordNewViewTextValidations = {
  NewPasswordValueKey: null,
  ConfirmPasswordValueKey: null,
};

mixin $ForgotPasswordNewView on StatelessWidget {
  TextEditingController get newPasswordController =>
      _getFormTextEditingController(NewPasswordValueKey);
  TextEditingController get confirmPasswordController =>
      _getFormTextEditingController(ConfirmPasswordValueKey);
  FocusNode get newPasswordFocusNode => _getFormFocusNode(NewPasswordValueKey);
  FocusNode get confirmPasswordFocusNode =>
      _getFormFocusNode(ConfirmPasswordValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_ForgotPasswordNewViewTextEditingControllers.containsKey(key)) {
      return _ForgotPasswordNewViewTextEditingControllers[key]!;
    }
    _ForgotPasswordNewViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ForgotPasswordNewViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ForgotPasswordNewViewFocusNodes.containsKey(key)) {
      return _ForgotPasswordNewViewFocusNodes[key]!;
    }
    _ForgotPasswordNewViewFocusNodes[key] = FocusNode();
    return _ForgotPasswordNewViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    newPasswordController.addListener(() => _updateFormData(model));
    confirmPasswordController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the dynamic
  void _updateFormData(dynamic model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NewPasswordValueKey: newPasswordController.text,
          ConfirmPasswordValueKey: confirmPasswordController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        NewPasswordValueKey: _getValidationMessage(NewPasswordValueKey),
        ConfirmPasswordValueKey: _getValidationMessage(ConfirmPasswordValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _ForgotPasswordNewViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _ForgotPasswordNewViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _ForgotPasswordNewViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ForgotPasswordNewViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ForgotPasswordNewViewTextEditingControllers.clear();
    _ForgotPasswordNewViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get newPasswordValue =>
      this.formValueMap[NewPasswordValueKey] as String?;
  String? get confirmPasswordValue =>
      this.formValueMap[ConfirmPasswordValueKey] as String?;

  bool get hasNewPassword => this.formValueMap.containsKey(NewPasswordValueKey);
  bool get hasConfirmPassword =>
      this.formValueMap.containsKey(ConfirmPasswordValueKey);

  bool get hasNewPasswordValidationMessage =>
      this.fieldsValidationMessages[NewPasswordValueKey]?.isNotEmpty ?? false;
  bool get hasConfirmPasswordValidationMessage =>
      this.fieldsValidationMessages[ConfirmPasswordValueKey]?.isNotEmpty ??
      false;

  String? get newPasswordValidationMessage =>
      this.fieldsValidationMessages[NewPasswordValueKey];
  String? get confirmPasswordValidationMessage =>
      this.fieldsValidationMessages[ConfirmPasswordValueKey];
}

extension Methods on FormViewModel {
  setNewPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NewPasswordValueKey] = validationMessage;
  setConfirmPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ConfirmPasswordValueKey] =
          validationMessage;
}
