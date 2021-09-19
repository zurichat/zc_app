import 'package:hng/ui/view/channel/new_channel/new_channel.form.dart';
import 'package:hng/utilities/validators.dart';
import 'package:stacked/stacked.dart';

class NewChannelViewModel extends FormViewModel {
  int inputLength = 80;
  bool inputError = false;
  bool isChannelPrivate = false;

  void toggleSwitch(bool value) {
    isChannelPrivate = value;
    notifyListeners();
  }

  void onChangeChannelNameField(String val) {
    _updateInputLength(val);
    _validateChannelName(val);
    notifyListeners();
  }

  void _updateInputLength(String val) {
    inputLength = 80 - val.length;
  }

  void _validateChannelName(String val) {
    bool validateChannel = Validator.validate.validateNewChannelName(val);
    if (validateChannel) {
      inputError = validateChannel;
    } else {
      inputError = validateChannel;
    }
  }

  @override
  void setFormStatus() {}
}
// import 'package:hng/app/app.router.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
//
// import 'new_channel.dart';
//
//
//
//
