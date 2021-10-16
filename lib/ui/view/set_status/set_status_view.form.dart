// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String StatusValueKey = 'status';

mixin $SetStatusView on StatelessWidget {
  final TextEditingController statusController = TextEditingController();
  final FocusNode statusFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    statusController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            StatusValueKey: statusController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    statusController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get statusValue => this.formValueMap[StatusValueKey];

  bool get hasStatus => this.formValueMap.containsKey(StatusValueKey);
}

extension Methods on FormViewModel {}
