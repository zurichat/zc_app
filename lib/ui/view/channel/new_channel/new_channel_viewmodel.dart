import 'package:hng/app/app.locator.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../utilities/mixins/validators_mixin.dart';
import 'new_channel.form.dart';

class NewChannelViewModel extends FormViewModel with ValidatorMixin {
  int inputLength = 80;
  bool inputError = false;
  bool isChannelPrivate = false;
  ChannelsApiService _channelApiService = locator<ChannelsApiService>();
  NavigationService _navigationService = locator<NavigationService>();
  SnackbarService _snackbarService = locator<SnackbarService>();

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

  void createChannel() async {
    if (channelNameValue == null ||
        channelDescriptionValue == null ||
        channelNameValue == '' ||
        channelDescriptionValue == null) {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Please fill all fields.',
      );

      return;
    }

    final res = await _channelApiService.createChannels(
      name: channelNameValue!,
      description: channelDescriptionValue!,
      private: isChannelPrivate,
    );

    if (res) {
      _snackbarService.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: 'Channels $channelNameValue created successful');
    } else {
      _snackbarService.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'An error occurred while creating channel $channelNameValue',
      );
    }

    _navigationService.popRepeated(1);
  }

  @override
  void setFormStatus() {}
}
