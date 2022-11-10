// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String StatusValueKey = 'status';

final Map<String, TextEditingController> _SetStatusViewTextEditingControllers =
    {};

final Map<String, FocusNode> _SetStatusViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SetStatusViewTextValidations = {
  StatusValueKey: null,
};

mixin $SetStatusView on StatelessWidget {
  TextEditingController get statusController =>
      _getFormTextEditingController(StatusValueKey);
  FocusNode get statusFocusNode => _getFormFocusNode(StatusValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_SetStatusViewTextEditingControllers.containsKey(key)) {
      return _SetStatusViewTextEditingControllers[key]!;
    }
    _SetStatusViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SetStatusViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SetStatusViewFocusNodes.containsKey(key)) {
      return _SetStatusViewFocusNodes[key]!;
    }
    _SetStatusViewFocusNodes[key] = FocusNode();
    return _SetStatusViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    statusController.addListener(() => _updateFormData(model));
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
          StatusValueKey: statusController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        StatusValueKey: _getValidationMessage(StatusValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _SetStatusViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_SetStatusViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SetStatusViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SetStatusViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SetStatusViewTextEditingControllers.clear();
    _SetStatusViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get statusValue => this.formValueMap[StatusValueKey] as String?;

  bool get hasStatus => this.formValueMap.containsKey(StatusValueKey);

  bool get hasStatusValidationMessage =>
      this.fieldsValidationMessages[StatusValueKey]?.isNotEmpty ?? false;

  String? get statusValidationMessage =>
      this.fieldsValidationMessages[StatusValueKey];
}

extension Methods on FormViewModel {
  setStatusValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StatusValueKey] = validationMessage;
}
