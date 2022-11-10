// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String SearchValueKey = 'search';

final Map<String, TextEditingController>
    _GeneralSearchViewTextEditingControllers = {};

final Map<String, FocusNode> _GeneralSearchViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _GeneralSearchViewTextValidations = {
  SearchValueKey: null,
};

mixin $GeneralSearchView on StatelessWidget {
  TextEditingController get searchController =>
      _getFormTextEditingController(SearchValueKey);
  FocusNode get searchFocusNode => _getFormFocusNode(SearchValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_GeneralSearchViewTextEditingControllers.containsKey(key)) {
      return _GeneralSearchViewTextEditingControllers[key]!;
    }
    _GeneralSearchViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _GeneralSearchViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_GeneralSearchViewFocusNodes.containsKey(key)) {
      return _GeneralSearchViewFocusNodes[key]!;
    }
    _GeneralSearchViewFocusNodes[key] = FocusNode();
    return _GeneralSearchViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    searchController.addListener(() => _updateFormData(model));
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
          SearchValueKey: searchController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        SearchValueKey: _getValidationMessage(SearchValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _GeneralSearchViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_GeneralSearchViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _GeneralSearchViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _GeneralSearchViewFocusNodes.values) {
      focusNode.dispose();
    }

    _GeneralSearchViewTextEditingControllers.clear();
    _GeneralSearchViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get searchValue => this.formValueMap[SearchValueKey] as String?;

  bool get hasSearch => this.formValueMap.containsKey(SearchValueKey);

  bool get hasSearchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey]?.isNotEmpty ?? false;

  String? get searchValidationMessage =>
      this.fieldsValidationMessages[SearchValueKey];
}

extension Methods on FormViewModel {
  setSearchValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SearchValueKey] = validationMessage;
}
