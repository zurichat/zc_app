// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ForgotEmailValueKey = 'forgotEmail';

final Map<String, TextEditingController>
    _ForgotPasswordEmailViewTextEditingControllers = {};

final Map<String, FocusNode> _ForgotPasswordEmailViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ForgotPasswordEmailViewTextValidations = {
  ForgotEmailValueKey: null,
};

mixin $ForgotPasswordEmailView on StatelessWidget {
  TextEditingController get forgotEmailController =>
      _getFormTextEditingController(ForgotEmailValueKey);
  FocusNode get forgotEmailFocusNode => _getFormFocusNode(ForgotEmailValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_ForgotPasswordEmailViewTextEditingControllers.containsKey(key)) {
      return _ForgotPasswordEmailViewTextEditingControllers[key]!;
    }
    _ForgotPasswordEmailViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ForgotPasswordEmailViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ForgotPasswordEmailViewFocusNodes.containsKey(key)) {
      return _ForgotPasswordEmailViewFocusNodes[key]!;
    }
    _ForgotPasswordEmailViewFocusNodes[key] = FocusNode();
    return _ForgotPasswordEmailViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    forgotEmailController.addListener(() => _updateFormData(model));
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
          ForgotEmailValueKey: forgotEmailController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        ForgotEmailValueKey: _getValidationMessage(ForgotEmailValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _ForgotPasswordEmailViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _ForgotPasswordEmailViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _ForgotPasswordEmailViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ForgotPasswordEmailViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ForgotPasswordEmailViewTextEditingControllers.clear();
    _ForgotPasswordEmailViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get forgotEmailValue =>
      this.formValueMap[ForgotEmailValueKey] as String?;

  bool get hasForgotEmail => this.formValueMap.containsKey(ForgotEmailValueKey);

  bool get hasForgotEmailValidationMessage =>
      this.fieldsValidationMessages[ForgotEmailValueKey]?.isNotEmpty ?? false;

  String? get forgotEmailValidationMessage =>
      this.fieldsValidationMessages[ForgotEmailValueKey];
}

extension Methods on FormViewModel {
  setForgotEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ForgotEmailValueKey] = validationMessage;
}
