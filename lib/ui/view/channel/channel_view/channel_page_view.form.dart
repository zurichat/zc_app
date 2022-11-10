// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ChannelMessagesValueKey = 'channelMessages';

final Map<String, TextEditingController>
    _ChannelPageViewTextEditingControllers = {};

final Map<String, FocusNode> _ChannelPageViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ChannelPageViewTextValidations =
    {
  ChannelMessagesValueKey: null,
};

mixin $ChannelPageView on StatelessWidget {
  TextEditingController get channelMessagesController =>
      _getFormTextEditingController(ChannelMessagesValueKey);
  FocusNode get channelMessagesFocusNode =>
      _getFormFocusNode(ChannelMessagesValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_ChannelPageViewTextEditingControllers.containsKey(key)) {
      return _ChannelPageViewTextEditingControllers[key]!;
    }
    _ChannelPageViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ChannelPageViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ChannelPageViewFocusNodes.containsKey(key)) {
      return _ChannelPageViewFocusNodes[key]!;
    }
    _ChannelPageViewFocusNodes[key] = FocusNode();
    return _ChannelPageViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    channelMessagesController.addListener(() => _updateFormData(model));
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
          ChannelMessagesValueKey: channelMessagesController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        ChannelMessagesValueKey: _getValidationMessage(ChannelMessagesValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _ChannelPageViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_ChannelPageViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _ChannelPageViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ChannelPageViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ChannelPageViewTextEditingControllers.clear();
    _ChannelPageViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get channelMessagesValue =>
      this.formValueMap[ChannelMessagesValueKey] as String?;

  bool get hasChannelMessages =>
      this.formValueMap.containsKey(ChannelMessagesValueKey);

  bool get hasChannelMessagesValidationMessage =>
      this.fieldsValidationMessages[ChannelMessagesValueKey]?.isNotEmpty ??
      false;

  String? get channelMessagesValidationMessage =>
      this.fieldsValidationMessages[ChannelMessagesValueKey];
}

extension Methods on FormViewModel {
  setChannelMessagesValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ChannelMessagesValueKey] =
          validationMessage;
}
