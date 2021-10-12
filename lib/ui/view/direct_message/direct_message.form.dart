// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String DirectMessagesValueKey = 'directMessages';

mixin $DirectMessage on StatelessWidget {
  final TextEditingController directMessagesController =
      TextEditingController();
  final FocusNode directMessagesFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    directMessagesController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            DirectMessagesValueKey: directMessagesController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    directMessagesController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get directMessagesValue => this.formValueMap[DirectMessagesValueKey];

  bool get hasDirectMessages =>
      this.formValueMap.containsKey(DirectMessagesValueKey);
}

extension Methods on FormViewModel {}
