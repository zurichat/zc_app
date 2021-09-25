// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String DescriptionValueKey = 'description';
const String TopicValueKey = 'topic';

mixin $EditChannelPageView on StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController topicController = TextEditingController();
  final FocusNode descriptionFocusNode = FocusNode();
  final FocusNode topicFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    descriptionController.addListener(() => _updateFormData(model));
    topicController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            DescriptionValueKey: descriptionController.text,
            TopicValueKey: topicController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    descriptionController.dispose();
    topicController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get descriptionValue => this.formValueMap[DescriptionValueKey];
  String? get topicValue => this.formValueMap[TopicValueKey];

  bool get hasDescription => this.formValueMap.containsKey(DescriptionValueKey);
  bool get hasTopic => this.formValueMap.containsKey(TopicValueKey);
}

extension Methods on FormViewModel {}
