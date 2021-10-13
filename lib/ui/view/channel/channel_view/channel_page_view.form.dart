// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ChannelMessagesValueKey = 'channelMessages';

mixin $ChannelPageView on StatelessWidget {
  final TextEditingController channelMessagesController =
      TextEditingController();
  final FocusNode channelMessagesFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    channelMessagesController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            ChannelMessagesValueKey: channelMessagesController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    channelMessagesController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get channelMessagesValue =>
      this.formValueMap[ChannelMessagesValueKey];

  bool get hasChannelMessages =>
      this.formValueMap.containsKey(ChannelMessagesValueKey);
}

extension Methods on FormViewModel {}
