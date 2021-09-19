import 'package:hng/utilities/validators.dart';
import 'package:stacked/stacked.dart';

class ForgotPasswordEmailViewModel extends FormViewModel {
  bool inputError = false;

  void submitEmail(String val) {
    _emailValidation(val);
    notifyListeners();
  }

  void _emailValidation(String val) {
    bool validateEmail = Validator.validate.emailValidation(val);
    if (validateEmail) {
      inputError = validateEmail;
    } else {
      inputError = validateEmail;
    }
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}
