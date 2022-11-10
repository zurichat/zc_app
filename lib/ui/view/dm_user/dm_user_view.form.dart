// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String MessageValueKey = 'message';

final Map<String, TextEditingController> _DmUserViewTextEditingControllers = {};

final Map<String, FocusNode> _DmUserViewFocusNodes = {};

final Map<String, String? Function(String?)?> _DmUserViewTextValidations = {
  MessageValueKey: null,
};

mixin $DmUserView on StatelessWidget {
  TextEditingController get messageController =>
      _getFormTextEditingController(MessageValueKey);
  FocusNode get messageFocusNode => _getFormFocusNode(MessageValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_DmUserViewTextEditingControllers.containsKey(key)) {
      return _DmUserViewTextEditingControllers[key]!;
    }
    _DmUserViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _DmUserViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_DmUserViewFocusNodes.containsKey(key)) {
      return _DmUserViewFocusNodes[key]!;
    }
    _DmUserViewFocusNodes[key] = FocusNode();
    return _DmUserViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    messageController.addListener(() => _updateFormData(model));
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
          MessageValueKey: messageController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        MessageValueKey: _getValidationMessage(MessageValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _DmUserViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_DmUserViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _DmUserViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _DmUserViewFocusNodes.values) {
      focusNode.dispose();
    }

    _DmUserViewTextEditingControllers.clear();
    _DmUserViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get messageValue => this.formValueMap[MessageValueKey] as String?;

  bool get hasMessage => this.formValueMap.containsKey(MessageValueKey);

  bool get hasMessageValidationMessage =>
      this.fieldsValidationMessages[MessageValueKey]?.isNotEmpty ?? false;

  String? get messageValidationMessage =>
      this.fieldsValidationMessages[MessageValueKey];
}

extension Methods on FormViewModel {
  setMessageValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MessageValueKey] = validationMessage;
}
