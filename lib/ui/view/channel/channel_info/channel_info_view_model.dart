import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';

class ChannelInfoViewModel extends BaseViewModel {
  final snackbar = locator<SnackbarService>();
  final _apiService = HttpApiService(channelsBaseUrl);
  final _navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();

  String? _channelDescription;

  String get channelDescription {
    return _channelDescription ?? 'No description Added';
  }

  void setChannelDescription(String channelDescription) {
    _channelDescription = channelDescription;
    print('pppp $channelDescription');
    notifyListeners();
  }

  void navigateToEditChannel() {
    _navigationService.navigateTo(Routes.editChannelPageView);
  }

  void navigateToMembersList() {}
  // _navigationService.navigateTo(Routes.editChannelPage);

  getChannelInfo() async {
    const channel_id = '613f70bd6173056af01b4aba';
    const endpoint = 'v1/1/channels/$channel_id/';

    final response = await _apiService.get(endpoint);
    if (response?.statusCode == 200) {
      print(response?.data);
      String channelName = response?.data['name'];
      String des = response?.data['description'];
      print('sacas $des');
      setChannelDescription(des);

      /*storage.setString(
        StorageKeys.currentSessionToken,
        response?.data['data']['name']['token'],
      );*/
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: response?.data['message'] ?? 'Update succesful',
      );
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: response?.data['message'] ??
            'Error encountered during channel update.',
      );
    }
  }
}
