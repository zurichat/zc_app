// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String DescriptionValueKey = 'description';
const String TopicValueKey = 'topic';

final Map<String, TextEditingController>
    _EditChannelPageViewTextEditingControllers = {};

final Map<String, FocusNode> _EditChannelPageViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _EditChannelPageViewTextValidations = {
  DescriptionValueKey: null,
  TopicValueKey: null,
};

mixin $EditChannelPageView on StatelessWidget {
  TextEditingController get descriptionController =>
      _getFormTextEditingController(DescriptionValueKey);
  TextEditingController get topicController =>
      _getFormTextEditingController(TopicValueKey);
  FocusNode get descriptionFocusNode => _getFormFocusNode(DescriptionValueKey);
  FocusNode get topicFocusNode => _getFormFocusNode(TopicValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_EditChannelPageViewTextEditingControllers.containsKey(key)) {
      return _EditChannelPageViewTextEditingControllers[key]!;
    }
    _EditChannelPageViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _EditChannelPageViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_EditChannelPageViewFocusNodes.containsKey(key)) {
      return _EditChannelPageViewFocusNodes[key]!;
    }
    _EditChannelPageViewFocusNodes[key] = FocusNode();
    return _EditChannelPageViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    descriptionController.addListener(() => _updateFormData(model));
    topicController.addListener(() => _updateFormData(model));
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
          DescriptionValueKey: descriptionController.text,
          TopicValueKey: topicController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the dynamic
  void _updateValidationData(dynamic model) => model.setValidationMessages({
        DescriptionValueKey: _getValidationMessage(DescriptionValueKey),
        TopicValueKey: _getValidationMessage(TopicValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _EditChannelPageViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_EditChannelPageViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _EditChannelPageViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _EditChannelPageViewFocusNodes.values) {
      focusNode.dispose();
    }

    _EditChannelPageViewTextEditingControllers.clear();
    _EditChannelPageViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get descriptionValue =>
      this.formValueMap[DescriptionValueKey] as String?;
  String? get topicValue => this.formValueMap[TopicValueKey] as String?;

  bool get hasDescription => this.formValueMap.containsKey(DescriptionValueKey);
  bool get hasTopic => this.formValueMap.containsKey(TopicValueKey);

  bool get hasDescriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey]?.isNotEmpty ?? false;
  bool get hasTopicValidationMessage =>
      this.fieldsValidationMessages[TopicValueKey]?.isNotEmpty ?? false;

  String? get descriptionValidationMessage =>
      this.fieldsValidationMessages[DescriptionValueKey];
  String? get topicValidationMessage =>
      this.fieldsValidationMessages[TopicValueKey];
}

extension Methods on FormViewModel {
  setDescriptionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DescriptionValueKey] = validationMessage;
  setTopicValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TopicValueKey] = validationMessage;
}
