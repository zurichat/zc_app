// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ForgotEmailValueKey = 'forgotEmail';

mixin $ForgotPasswordEmailView on StatelessWidget {
  final TextEditingController forgotEmailController = TextEditingController();
  final FocusNode forgotEmailFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    forgotEmailController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            ForgotEmailValueKey: forgotEmailController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    forgotEmailController.dispose();
    forgotEmailFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get forgotEmailValue => this.formValueMap[ForgotEmailValueKey];

  bool get hasForgotEmail => this.formValueMap.containsKey(ForgotEmailValueKey);
}

extension Methods on FormViewModel {}
