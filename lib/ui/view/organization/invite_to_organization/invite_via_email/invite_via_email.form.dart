// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String EmailValueKey = 'email';

final Map<String, TextEditingController> _InviteViaEmailTextEditingControllers =
    {};

final Map<String, FocusNode> _InviteViaEmailFocusNodes = {};

final Map<String, String? Function(String?)?> _InviteViaEmailTextValidations = {
  EmailValueKey: null,
};

mixin $InviteViaEmail on StatelessWidget {
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_InviteViaEmailTextEditingControllers.containsKey(key)) {
      return _InviteViaEmailTextEditingControllers[key]!;
    }
    _InviteViaEmailTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _InviteViaEmailTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_InviteViaEmailFocusNodes.containsKey(key)) {
      return _InviteViaEmailFocusNodes[key]!;
    }
    _InviteViaEmailFocusNodes[key] = FocusNode();
    return _InviteViaEmailFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    emailController.addListener(() => _updateFormData(model));
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
          EmailValueKey: emailController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        EmailValueKey: _getValidationMessage(EmailValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _InviteViaEmailTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_InviteViaEmailTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _InviteViaEmailTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _InviteViaEmailFocusNodes.values) {
      focusNode.dispose();
    }

    _InviteViaEmailTextEditingControllers.clear();
    _InviteViaEmailFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;

  bool get hasEmail => this.formValueMap.containsKey(EmailValueKey);

  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;

  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
}

extension Methods on FormViewModel {
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
}
