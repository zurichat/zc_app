// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ThreadMessagesValueKey = 'threadMessages';

mixin $ThreadDetailView on StatelessWidget {
  final TextEditingController threadMessagesController =
      TextEditingController();
  final FocusNode threadMessagesFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    threadMessagesController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            ThreadMessagesValueKey: threadMessagesController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    threadMessagesController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get threadMessagesValue => this.formValueMap[ThreadMessagesValueKey];

  bool get hasThreadMessages =>
      this.formValueMap.containsKey(ThreadMessagesValueKey);
}

extension Methods on FormViewModel {}
