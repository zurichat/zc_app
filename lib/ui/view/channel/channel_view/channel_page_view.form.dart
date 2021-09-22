// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String EditorValueKey = 'editor';

mixin $ChannelPageView on StatelessWidget {
  final TextEditingController editorController = TextEditingController();
  final FocusNode editorFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    editorController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            EditorValueKey: editorController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    editorController.dispose();
    editorFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get editorValue => this.formValueMap[EditorValueKey];

  bool get hasEditor => this.formValueMap.containsKey(EditorValueKey);
}

extension Methods on FormViewModel {}
