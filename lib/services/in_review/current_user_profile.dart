import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/models/profile_model.dart';
import 'package:zurichat/utilities/api_handlers/zuri_api.dart';
import 'package:zurichat/utilities/constants/app_constants.dart';
import 'package:zurichat/utilities/enums.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app_services/local_storage_services.dart';

class GetUserProfile {
  final log = getLogger('Get User Profile');
  final _api = locator<ZuriApi>();
  final snackbar = locator<SnackbarService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  /// Fetches info of the current user
  Future<ProfileModel> currentUser() async {
    String? orgId = storageService.getString(StorageKeys.currentOrgId);
    //String? userId = storageService.getString(StorageKeys.currentUserId);
    String? userEmail = storageService.getString(StorageKeys.currentUserEmail);
    String endPoint = '/organizations/$orgId/members?query=$userEmail';

    final res = await _api.get("$coreBaseUrl/$endPoint", token: token);

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
        StorageKeys.phoneNum,
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
      ProfileModel profile = ProfileModel.fromJson(res.data?['data'][0]);
      log.i(profile.firstName);
      log.i(profile);
      return profile;
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
