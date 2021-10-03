// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FullNameValueKey = 'fullName';
const String DisplayNameValueKey = 'displayName';
const String PhoneNumberValueKey = 'phoneNumber';

mixin $EditProfileView on StatelessWidget {
  final TextEditingController full_nameController = TextEditingController();
  final TextEditingController display_nameController = TextEditingController();
  final TextEditingController phone_numberController = TextEditingController();
  final FocusNode full_nameFocusNode = FocusNode();
  final FocusNode display_nameFocusNode = FocusNode();
  final FocusNode phone_numberFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    full_nameController.addListener(() => _updateFormData(model));
    display_nameController.addListener(() => _updateFormData(model));
    phone_numberController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            FullNameValueKey: full_nameController.text,
            DisplayNameValueKey: display_nameController.text,
            PhoneNumberValueKey: phone_numberController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    full_nameController.dispose();
    display_nameController.dispose();
    phone_numberController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get fullNameValue => this.formValueMap[FullNameValueKey];
  String? get displayNameValue => this.formValueMap[DisplayNameValueKey];
  String? get phoneNumberValue => this.formValueMap[PhoneNumberValueKey];

  bool get hasFullName => this.formValueMap.containsKey(FullNameValueKey);
  bool get hasDisplayName => this.formValueMap.containsKey(DisplayNameValueKey);
  bool get hasPhoneNumber => this.formValueMap.containsKey(PhoneNumberValueKey);
}

extension Methods on FormViewModel {}
