import '../extensions/string_extension.dart';

mixin ValidatorMixin {
  String? validateNotEmptyField(String input, [String? label]) {
    if (input.isEmpty)
      return label == null ? 'This field cannot be empty' : 'Enter a $label';
    else
      return null;
  }

  String? validateEmail(String input) {
    if (input.validateEmail())
      return null;
    else if (input.isEmpty)
      return 'Enter your email';
    else
      return 'Enter a valid email address';
  }

  String? validatePassword(input) {
    if (input.isNotEmpty)
      return null;
    else
      return 'Enter your password';
  }

  String? validateConfirmPasswordField(String input, String password) {
    if (input != password)
      return 'Passwords do not match';
    else
      return null;
  }

  bool validateNewChannelName(String input) {
    final reg = RegExp('.*?[A-Z\\s\.].*');
    if (reg.hasMatch(input)) {
      return true;
    } else {
      return false;
    }
  }

  bool emailValidation(String input) {
    if (input.isEmpty) {
      return false;
    } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_"
                r'`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
            .hasMatch(input) &&
        input.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool passValidation(
    String input,
  ) {
    if (input.length < 6 || input.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  // bool confirmPasswrod(String input2) {
  //   if (input1.isEmpty && input2.isEmpty) {
  //     return false;
  //   } else if (input1.isNotEmpty && input2.isNotEmpty) {
  //     return true;
  //   } else if (input1 != input2) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}