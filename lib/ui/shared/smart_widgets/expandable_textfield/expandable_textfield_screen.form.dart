// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String TextValueKey = 'text';

mixin $ExpandableTextFieldScreen on StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final FocusNode textFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    textController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            TextValueKey: textController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    textController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get textValue => formValueMap[TextValueKey];

  bool get hasText => formValueMap.containsKey(TextValueKey);
}

extension Methods on FormViewModel {}
