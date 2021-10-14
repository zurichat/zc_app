import 'package:hng/app/app.locator.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/channels/channels_api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../utilities/mixins/validators_mixin.dart';
import 'new_channel.form.dart';

class NewChannelViewModel extends FormViewModel with ValidatorMixin {
  int inputLength = 80;
  bool inputError = false;
  bool isChannelPrivate = false;

  final _channelApiService = locator<ChannelsApiService>();
  final _navigationService = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();

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
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: fillAllFields,
      );

      return;
    }

    final res = await _channelApiService.createChannels(
      name: channelNameValue!,
      description: channelDescriptionValue!,
      private: isChannelPrivate,
    );

    if (res) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: 'Channels $channelNameValue created successful',
      );
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: '$ErrorOccurredCreation $channelNameValue',
      );
    }

    _navigationService.popRepeated(1);
  }

  @override
  void setFormStatus() {}

  void navigateBack() {
    _navigationService.back();
  }
}
