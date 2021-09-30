// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String emailValueKey = 'email';
const String firstNameValueKey = 'firstName';
const String lastNameValueKey = 'lastName';
const String displayNameValueKey = 'displayName';
const String passwordValueKey = 'password';
const String confirmPasswordValueKey = 'confirmPassword';
const String phoneNumberValueKey = 'phoneNumber';

mixin $SignUpView on StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode displayNameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    emailController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    displayNameController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
    confirmPasswordController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            emailValueKey: emailController.text,
            firstNameValueKey: firstNameController.text,
            lastNameValueKey: lastNameController.text,
            displayNameValueKey: displayNameController.text,
            passwordValueKey: passwordController.text,
            confirmPasswordValueKey: confirmPasswordController.text,
            phoneNumberValueKey: phoneNumberController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    displayNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get emailValue => formValueMap[emailValueKey];
  String? get firstNameValue => formValueMap[firstNameValueKey];
  String? get lastNameValue => formValueMap[lastNameValueKey];
  String? get displayNameValue => formValueMap[displayNameValueKey];
  String? get passwordValue => formValueMap[passwordValueKey];
  String? get confirmPasswordValue => formValueMap[confirmPasswordValueKey];
  String? get phoneNumberValue => formValueMap[phoneNumberValueKey];

  bool get hasEmail => formValueMap.containsKey(emailValueKey);
  bool get hasFirstName => formValueMap.containsKey(firstNameValueKey);
  bool get hasLastName => formValueMap.containsKey(lastNameValueKey);
  bool get hasDisplayName => formValueMap.containsKey(displayNameValueKey);
  bool get hasPassword => formValueMap.containsKey(passwordValueKey);
  bool get hasConfirmPassword =>
      formValueMap.containsKey(confirmPasswordValueKey);
  bool get hasPhoneNumber => formValueMap.containsKey(phoneNumberValueKey);
}

extension Methods on FormViewModel {}
