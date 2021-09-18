import 'package:flutter/material.dart';
import 'package:hng/ui/shared/colors.dart';
import 'package:hng/utilities/validators.dart';
import 'package:stacked/stacked.dart';

class NewChannelViewModel extends BaseViewModel {
  int inputLength = 80;
  bool inputError = false;
  bool isChannelPrivate = false;
  Color borderColor = AppColors.borderColor;
  TextEditingController channelNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
      borderColor = AppColors.redColor;
    } else {
      inputError = validateChannel;
      borderColor = AppColors.borderColor;
    }
  }
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
