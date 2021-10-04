import 'package:hng/constants/app_strings.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/enums.dart';
import 'edit_channel_view.form.dart';

class EditChannelViewModel extends FormViewModel {
  //final _apiService = locator<ChannelApiService>();
  //final storage = locator<SharedPreferenceLocalStorage>();
  final navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final snackbar = locator<SnackbarService>();
  final _apiService = ZuriApi(channelsBaseUrl);
  String? get token => storage.getString(StorageKeys.currentSessionToken);
  bool isLoading = false;
  loading(status) {
    isLoading = status;
    notifyListeners();
  }

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
    const channel_id = '613f70bd6173056af01b4aba';
    const endpoint = '$ChannelInfoEndpoint$channel_id/';
    final des = {/*'topic': topic.text, */ 'description': descriptionValue};
    final response = await _apiService.put(endpoint, body: des, token: token);
    if (response?.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: response?.data['message'] ?? UpdateSuccessful,
      );
      // Return to channel info
      nToChannelInfo();
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: response?.data['message'] ?? ChannelUpdateError,
      );
    }
    /*var token = storage.getString(StorageKeys.currentSessionToken);
    print('dsv $token');
    const channel_id = '613f70bd6173056af01b4aba';
    const endpoint = '/v1/1/channels/$channel_id/';
    // Called when save button in the edit channel view is pressed
    final des = {/*'topic': topic.text, */ 'description': description.text};
    final response = await _apiService.put(endpoint, data: des, headers: {
      'Authorization': 'Bearer $token',
    });
    loading(false);
    if (response?.statusCode == 200) {
      AppSnackBar.success(
        context,
        response?.data['message'],
      );
      // Return to channel info
      nToChannelInfo();
    } else {
      AppSnackBar.failure(
          context,
          response?.data['message'] ??
              'Error encountered during channel update.');
    }*/
  }

  // Navigate to channel info view
  nToChannelInfo() {
    NavigationService().navigateTo(Routes.channelInfoView);
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
  // ignore: always_declare_return_types
  /*Future logInUser(context) async {
    loading(true);
    const endpoint = '/auth/login';
    if (email.text == '' || password.text == '') {
      loading(false);
      AppSnackBar.failure(context, 'Please fill all fields.');
      return;
    }
    final loginData = {'email': email.text, 'password': password.text};
    final response = await _apiService.post(endpoint, data: loginData);
    loading(false);
    if (response?.statusCode == 200) {
      storage.setString(
        StorageKeys.currentSessionToken,
        response?.data['data']['user']['token'],
      );
      storage.setString(
        StorageKeys.currentUserId,
        response?.data['data']['user']['id'],
      );
      storage.setString(
        StorageKeys.currentUserEmail,
        response?.data['data']['user']['email'],
      );
      // final userModel = UserModel.fromJson(response?.data['data']['user']);
      AppSnackBar.success(
        context,
        ''' ${response?.data['message']} for '''
        '''${response?.data['data']['user']['email']}''',
      );
      navigationService.navigateTo(Routes.navBarView);
    } else {
      AppSnackBar.failure(context,
          response?.data['message'] ?? 'Error encountered during login.');
    }
  }*/
}
