import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../package/base/server-request/channels/channels_api_service.dart';
import '../../../services/connectivity_service.dart';
import '../../../utilities/enums.dart';

class DeleteChannelDialogViewModel extends BaseViewModel {
  final connectivityService = locator<ConnectivityService>();
  final _channelsApiService = locator<ChannelsApiService>();

  final _navigationService = locator<NavigationService>();
  final snackbar = locator<SnackbarService>();

  popNavigation() {
    _navigationService.popRepeated(1);
  }

  deleteChannel() async {
    bool deleted = await _channelsApiService.deleteChannels();
    if (deleted) {
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 3),
          variant: SnackbarType.success,
          message: 'Channel deleted succesfully');
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'An error occured while deleting channel ',
      );
    }
   _navigationService.navigateTo(Routes.homePage);
  }
}
