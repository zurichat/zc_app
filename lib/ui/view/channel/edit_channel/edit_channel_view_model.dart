import 'package:zurichat/utilities/constants/app_strings.dart';
import 'package:zurichat/utilities/api_handlers/zuri_api.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';
// import 'package:zurichat/utilities/utilities.dart';
// import 'package:zurichat/utilities/utilities.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/app_services/local_storage_services.dart';
import '../../../../utilities/constants/app_constants.dart';
import '../../../../utilities/enums.dart';
import 'edit_channel_view.form.dart';

class EditChannelViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final snackbar = locator<SnackbarService>();
  final _apiService = ZuriApi(channelsBaseUrl);
  final _navigationService = locator<NavigationService>();
  String id = '';
  String? get token => storage.getString(StorageKeys.currentSessionToken);
  bool isLoading = false;
  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  onChanged(String val) {}

  editChannel() async {
    loading(true);
    if (topicValue == '' || descriptionValue == '') {
      loading(false);
      //Hides the keyboard for the failure snackbar to be visible
      // FocusScope.of(context).unfocus();
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: fillAllFields,
      );

      return;
    }
    String _channelId = id;
    String orgId = storage.getString(StorageKeys.currentOrgId).toString();
    String endpoint = 'v1/$orgId/channels/$_channelId/';
    //TODO INCORRECT DESCRIPTION
    final des = {
      'description': descriptionValue,
      "name": "NewTest",
      "private": false,
      "archived": false,
      'topic': topicValue,
      "starred": false
    };
    final response = await _apiService.put(endpoint, body: des, token: token);

    if (response?.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: response?.data['message'] ?? UpdateSuccessful,
      );
      // Return to channel info
      navigateBack();
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: response?.data['message'] ?? ChannelUpdateError,
      );
    }
  }

  // Navigate to channel info view
  nToChannelInfo() {
    NavigationService().navigateTo(Routes.channelInfoView);
  }

  navigateBack() {
    _navigationService.back();
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  void setChannelID(String channelId) {
    id = channelId;
  }
}
