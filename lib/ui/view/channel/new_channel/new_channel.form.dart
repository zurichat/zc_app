// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ChannelNameValueKey = 'channelName';
const String ChannelDescriptionValueKey = 'channelDescription';

final Map<String, TextEditingController> _NewChannelTextEditingControllers = {};

final Map<String, FocusNode> _NewChannelFocusNodes = {};

final Map<String, String? Function(String?)?> _NewChannelTextValidations = {
  ChannelNameValueKey: null,
  ChannelDescriptionValueKey: null,
};

mixin $NewChannel on StatelessWidget {
  TextEditingController get channelNameController =>
      _getFormTextEditingController(ChannelNameValueKey);
  TextEditingController get channelDescriptionController =>
      _getFormTextEditingController(ChannelDescriptionValueKey);
  FocusNode get channelNameFocusNode => _getFormFocusNode(ChannelNameValueKey);
  FocusNode get channelDescriptionFocusNode =>
      _getFormFocusNode(ChannelDescriptionValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_NewChannelTextEditingControllers.containsKey(key)) {
      return _NewChannelTextEditingControllers[key]!;
    }
    _NewChannelTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _NewChannelTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_NewChannelFocusNodes.containsKey(key)) {
      return _NewChannelFocusNodes[key]!;
    }
    _NewChannelFocusNodes[key] = FocusNode();
    return _NewChannelFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    channelNameController.addListener(() => _updateFormData(model));
    channelDescriptionController.addListener(() => _updateFormData(model));
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
          ChannelNameValueKey: channelNameController.text,
          ChannelDescriptionValueKey: channelDescriptionController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        ChannelNameValueKey: _getValidationMessage(ChannelNameValueKey),
        ChannelDescriptionValueKey:
            _getValidationMessage(ChannelDescriptionValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _NewChannelTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_NewChannelTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _NewChannelTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _NewChannelFocusNodes.values) {
      focusNode.dispose();
    }

    _NewChannelTextEditingControllers.clear();
    _NewChannelFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get channelNameValue =>
      this.formValueMap[ChannelNameValueKey] as String?;
  String? get channelDescriptionValue =>
      this.formValueMap[ChannelDescriptionValueKey] as String?;

  bool get hasChannelName => this.formValueMap.containsKey(ChannelNameValueKey);
  bool get hasChannelDescription =>
      this.formValueMap.containsKey(ChannelDescriptionValueKey);

  bool get hasChannelNameValidationMessage =>
      this.fieldsValidationMessages[ChannelNameValueKey]?.isNotEmpty ?? false;
  bool get hasChannelDescriptionValidationMessage =>
      this.fieldsValidationMessages[ChannelDescriptionValueKey]?.isNotEmpty ??
      false;

  String? get channelNameValidationMessage =>
      this.fieldsValidationMessages[ChannelNameValueKey];
  String? get channelDescriptionValidationMessage =>
      this.fieldsValidationMessages[ChannelDescriptionValueKey];
}

extension Methods on FormViewModel {
  setChannelNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ChannelNameValueKey] = validationMessage;
  setChannelDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ChannelDescriptionValueKey] =
          validationMessage;
}
