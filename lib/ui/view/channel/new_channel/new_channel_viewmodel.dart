import 'package:hng/app/app.locator.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/ui/view/channel/channel_view/channel_page_view.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'new_channel.form.dart';
import 'package:hng/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../utilities/mixins/validators_mixin.dart';

class NewChannelViewModel extends FormViewModel with ValidatorMixin {
  final _navigationService = locator<NavigationService>();

  int inputLength = 80;
  bool inputError = false;
  bool isChannelPrivate = false;

  final _channelApiService = locator<ChannelsApiService>();
  final snackbar = locator<SnackbarService>();

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

  void createChannel() {
    if (channelNameValue == null ||
        channelDescriptionValue == null ||
        channelNameValue == '' ||
        channelDescriptionValue == null) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Please fill all fields.',
      );

      return;
    }

    _channelApiService.createChannels(
      name: channelNameValue!,
      description: channelDescriptionValue!,
      private: false,
    );
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
