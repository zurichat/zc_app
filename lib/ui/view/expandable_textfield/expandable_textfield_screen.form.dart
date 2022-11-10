// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String TextValueKey = 'text';

final Map<String, TextEditingController>
    _ExpandableTextFieldScreenTextEditingControllers = {};

final Map<String, FocusNode> _ExpandableTextFieldScreenFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ExpandableTextFieldScreenTextValidations = {
  TextValueKey: null,
};

mixin $ExpandableTextFieldScreen on StatelessWidget {
  TextEditingController get textController =>
      _getFormTextEditingController(TextValueKey);
  FocusNode get textFocusNode => _getFormFocusNode(TextValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_ExpandableTextFieldScreenTextEditingControllers.containsKey(key)) {
      return _ExpandableTextFieldScreenTextEditingControllers[key]!;
    }
    _ExpandableTextFieldScreenTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ExpandableTextFieldScreenTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ExpandableTextFieldScreenFocusNodes.containsKey(key)) {
      return _ExpandableTextFieldScreenFocusNodes[key]!;
    }
    _ExpandableTextFieldScreenFocusNodes[key] = FocusNode();
    return _ExpandableTextFieldScreenFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    textController.addListener(() => _updateFormData(model));
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
          TextValueKey: textController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        TextValueKey: _getValidationMessage(TextValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _ExpandableTextFieldScreenTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _ExpandableTextFieldScreenTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _ExpandableTextFieldScreenTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ExpandableTextFieldScreenFocusNodes.values) {
      focusNode.dispose();
    }

    _ExpandableTextFieldScreenTextEditingControllers.clear();
    _ExpandableTextFieldScreenFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get textValue => this.formValueMap[TextValueKey] as String?;

  bool get hasText => this.formValueMap.containsKey(TextValueKey);

  bool get hasTextValidationMessage =>
      this.fieldsValidationMessages[TextValueKey]?.isNotEmpty ?? false;

  String? get textValidationMessage =>
      this.fieldsValidationMessages[TextValueKey];
}

extension Methods on FormViewModel {
  setTextValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TextValueKey] = validationMessage;
}
