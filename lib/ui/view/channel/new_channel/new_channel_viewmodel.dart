import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../utilities/mixins/validators_mixin.dart';

class NewChannelViewModel extends FormViewModel with ValidatorMixin {
  final _navigationService = locator<NavigationService>();

  int inputLength = 80;
  bool inputError = false;
  bool isChannelPrivate = false;

  void navigateToChannelPageView() {
    _navigationService.navigateTo(Routes.channelPageView);
  }

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
    final validateChannel = validateNewChannelName(val);
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
