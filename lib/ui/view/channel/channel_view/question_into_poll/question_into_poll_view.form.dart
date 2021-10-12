// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String QuestionValueKey = 'question';
const String OptionOneValueKey = 'optionOne';
const String OptionTwoValueKey = 'optionTwo';

mixin $QuestionIntoPollView on StatelessWidget {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController optionOneController = TextEditingController();
  final TextEditingController optionTwoController = TextEditingController();
  final FocusNode questionFocusNode = FocusNode();
  final FocusNode optionOneFocusNode = FocusNode();
  final FocusNode optionTwoFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    questionController.addListener(() => _updateFormData(model));
    optionOneController.addListener(() => _updateFormData(model));
    optionTwoController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            QuestionValueKey: questionController.text,
            OptionOneValueKey: optionOneController.text,
            OptionTwoValueKey: optionTwoController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    questionController.dispose();
    optionOneController.dispose();
    optionTwoController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get questionValue => this.formValueMap[QuestionValueKey];
  String? get optionOneValue => this.formValueMap[OptionOneValueKey];
  String? get optionTwoValue => this.formValueMap[OptionTwoValueKey];

  bool get hasQuestion => this.formValueMap.containsKey(QuestionValueKey);
  bool get hasOptionOne => this.formValueMap.containsKey(OptionOneValueKey);
  bool get hasOptionTwo => this.formValueMap.containsKey(OptionTwoValueKey);
}

extension Methods on FormViewModel {}
