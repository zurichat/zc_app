// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String ChannelNameValueKey = 'channelName';
const String ChannelDescriptionValueKey = 'channelDescription';

mixin $NewChannel on StatelessWidget {
  final TextEditingController channelNameController = TextEditingController();
  final TextEditingController channelDescriptionController =
      TextEditingController();
  final FocusNode channelNameFocusNode = FocusNode();
  final FocusNode channelDescriptionFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    channelNameController.addListener(() => _updateFormData(model));
    channelDescriptionController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            ChannelNameValueKey: channelNameController.text,
            ChannelDescriptionValueKey: channelDescriptionController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    channelNameController.dispose();
    channelDescriptionController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get channelNameValue => this.formValueMap[ChannelNameValueKey];
  String? get channelDescriptionValue =>
      this.formValueMap[ChannelDescriptionValueKey];

  bool get hasChannelName => this.formValueMap.containsKey(ChannelNameValueKey);
  bool get hasChannelDescription =>
      this.formValueMap.containsKey(ChannelDescriptionValueKey);
}

extension Methods on FormViewModel {}
