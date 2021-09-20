import 'package:flutter/cupertino.dart';
import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditChannelViewModel extends BaseViewModel {
  //final _apiService = locator<ChannelApiService>();
  //final storage = locator<SharedPreferenceLocalStorage>();
  final navigationService = locator<NavigationService>();
  final storage = locator<SharedPreferenceLocalStorage>();
  final snackbar = locator<SnackbarService>();
  final _apiService = HttpApiService(channelsBaseUrl);
  bool isLoading = false;
  loading(status) {
    isLoading = status;
    notifyListeners();
  }

  TextEditingController topic = TextEditingController();
  TextEditingController description = TextEditingController();

  editChannel(context) async {
    loading(true);
    if (topic.text == '' || description.text == '') {
      loading(false);
      //Hides the keyboard for the failure snackbar to be visible
      // FocusScope.of(context).unfocus();
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: 'Please fill all fields.',
      );

      return;
    }
    const channel_id = '613f70bd6173056af01b4aba';
    const endpoint = '/v1/1/channels/$channel_id/';
    final des = {/*'topic': topic.text, */ 'description': description.text};
    final response = await _apiService.put(endpoint, data: des);
    if (response?.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.success,
        message: response?.data['message'] ?? 'Update succesful',
      );
      // Return to channel info
      nToChannelInfo();
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: response?.data['message'] ??
            'Error encountered during channel update.',
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
