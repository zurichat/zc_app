// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String DirectMessagesValueKey = 'directMessages';

final Map<String, TextEditingController> _DirectMessageTextEditingControllers =
    {};

final Map<String, FocusNode> _DirectMessageFocusNodes = {};

final Map<String, String? Function(String?)?> _DirectMessageTextValidations = {
  DirectMessagesValueKey: null,
};

mixin $DirectMessage on StatelessWidget {
  TextEditingController get directMessagesController =>
      _getFormTextEditingController(DirectMessagesValueKey);
  FocusNode get directMessagesFocusNode =>
      _getFormFocusNode(DirectMessagesValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_DirectMessageTextEditingControllers.containsKey(key)) {
      return _DirectMessageTextEditingControllers[key]!;
    }
    _DirectMessageTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _DirectMessageTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_DirectMessageFocusNodes.containsKey(key)) {
      return _DirectMessageFocusNodes[key]!;
    }
    _DirectMessageFocusNodes[key] = FocusNode();
    return _DirectMessageFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    directMessagesController.addListener(() => _updateFormData(model));
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
          DirectMessagesValueKey: directMessagesController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        DirectMessagesValueKey: _getValidationMessage(DirectMessagesValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _DirectMessageTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_DirectMessageTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _DirectMessageTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _DirectMessageFocusNodes.values) {
      focusNode.dispose();
    }

    _DirectMessageTextEditingControllers.clear();
    _DirectMessageFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get directMessagesValue =>
      this.formValueMap[DirectMessagesValueKey] as String?;

  bool get hasDirectMessages =>
      this.formValueMap.containsKey(DirectMessagesValueKey);

  bool get hasDirectMessagesValidationMessage =>
      this.fieldsValidationMessages[DirectMessagesValueKey]?.isNotEmpty ??
      false;

  String? get directMessagesValidationMessage =>
      this.fieldsValidationMessages[DirectMessagesValueKey];
}

extension Methods on FormViewModel {
  setDirectMessagesValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DirectMessagesValueKey] = validationMessage;
}
