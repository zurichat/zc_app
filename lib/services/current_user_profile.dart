import 'package:hng/app/app.locator.dart';
import 'package:hng/models/profile_model.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked_services/stacked_services.dart';

import 'local_storage_services.dart';

class GetUserProfile {
  final _api = HttpApiService('https://api.zuri.chat/');

  final storageService = locator<SharedPreferenceLocalStorage>();

  /// Fetches info of the current user
  Future<ProfileModel> currentUser() async {
    String? orgId = storageService.getString(StorageKeys.currentOrgId);
    //String? userId = storageService.getString(StorageKeys.currentUserId);
    String? userEmail = storageService.getString(StorageKeys.currentUserEmail);
    String endPoint = '/organizations/$orgId/members?query=$userEmail';
    print(
        'The email is ${storageService.getString(StorageKeys.currentUserEmail)}');
    //https://api.zuri.chat/organizations/614b53f244a9bd81cedc0bc9/members?query=jbadmin@gmail.com

    final res = await _api.get(endPoint, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
    final snackbar = locator<SnackbarService>();
    if (res!.statusCode == 200) {
      storageService.setString(
        StorageKeys.currentMemberID,
        res.data?['data'][0]['_id'],
      );
      storageService.setString(
        StorageKeys.firstName,
        res.data?['data'][0]['first_name'],
      );
      storageService.setString(
        StorageKeys.displayName,
        res.data?['data'][0]['display_name'],
      );
      storageService.setString(
        StorageKeys.status,
        res.data?['data'][0]['bio'],
      );
      storageService.setString(
        StorageKeys.phone_num,
        res.data?['data'][0]['phone'],
      );
      storageService.setString(
        StorageKeys.currentUserImageUrl,
        res.data?['data'][0]['image_url'],
      );

      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 5),
        variant: SnackbarType.success,
        message: ''' Profile Loaded  Successfully'''
            '''  Please Exit The Edit Profile Page Then Open It Once More ''',
      );

      return ProfileModel(
          imageUrl: res.data?['data'][0]['image_url'],
          firstName: res.data?['data'][0]['first_name'],
          displayName: res.data?['data'][0]['display_name'],
          status: res.data?['data'][0]['bio'],
          phoneNum: res.data?['data'][0]['phone']);
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: ''' Profile Load failed''',
      );
      return ProfileModel(
          imageUrl: res.data?['data'][0]['image_url'],
          firstName: res.data?['data'][0]['first_name'],
          displayName: res.data?['data'][0]['display_name'],
          status: res.data?['data'][0]['bio'],
          phoneNum: res.data?['data'][0]['phone']);
    }
  }
}
