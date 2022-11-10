// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String MessageValueKey = 'message';

final Map<String, TextEditingController> _StartDmViewTextEditingControllers =
    {};

final Map<String, FocusNode> _StartDmViewFocusNodes = {};

final Map<String, String? Function(String?)?> _StartDmViewTextValidations = {
  MessageValueKey: null,
};

mixin $StartDmView on StatelessWidget {
  TextEditingController get messageController =>
      _getFormTextEditingController(MessageValueKey);
  FocusNode get messageFocusNode => _getFormFocusNode(MessageValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_StartDmViewTextEditingControllers.containsKey(key)) {
      return _StartDmViewTextEditingControllers[key]!;
    }
    _StartDmViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _StartDmViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_StartDmViewFocusNodes.containsKey(key)) {
      return _StartDmViewFocusNodes[key]!;
    }
    _StartDmViewFocusNodes[key] = FocusNode();
    return _StartDmViewFocusNodes[key]!;
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
    final validatorForKey = _StartDmViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_StartDmViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _StartDmViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _StartDmViewFocusNodes.values) {
      focusNode.dispose();
    }

    _StartDmViewTextEditingControllers.clear();
    _StartDmViewFocusNodes.clear();
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
