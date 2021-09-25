// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String EmailValueKey = 'email';
const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String DisplayNameValueKey = 'displayName';
const String PasswordValueKey = 'password';
const String ConfirmPasswordValueKey = 'confirmPassword';
const String PhoneNumberValueKey = 'phoneNumber';

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

  /// Registers a listener on every generated
  /// controller that calls [model.setData()]
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
            EmailValueKey: emailController.text,
            FirstNameValueKey: firstNameController.text,
            LastNameValueKey: lastNameController.text,
            DisplayNameValueKey: displayNameController.text,
            PasswordValueKey: passwordController.text,
            ConfirmPasswordValueKey: confirmPasswordController.text,
            PhoneNumberValueKey: phoneNumberController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController
    // sets all listeners to null

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
  String? get emailValue => formValueMap[EmailValueKey];
  String? get firstNameValue => formValueMap[FirstNameValueKey];
  String? get lastNameValue => formValueMap[LastNameValueKey];
  String? get displayNameValue => formValueMap[DisplayNameValueKey];
  String? get passwordValue => formValueMap[PasswordValueKey];
  String? get confirmPasswordValue => formValueMap[ConfirmPasswordValueKey];
  String? get phoneNumberValue => formValueMap[PhoneNumberValueKey];

  bool get hasEmail => formValueMap.containsKey(EmailValueKey);
  bool get hasFirstName => formValueMap.containsKey(FirstNameValueKey);
  bool get hasLastName => formValueMap.containsKey(LastNameValueKey);
  bool get hasDisplayName => formValueMap.containsKey(DisplayNameValueKey);
  bool get hasPassword => formValueMap.containsKey(PasswordValueKey);
  bool get hasConfirmPassword =>
      formValueMap.containsKey(ConfirmPasswordValueKey);
  bool get hasPhoneNumber => formValueMap.containsKey(PhoneNumberValueKey);
}

extension Methods on FormViewModel {}
