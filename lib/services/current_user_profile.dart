import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.logger.dart';
import 'package:hng/models/profile_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/user_service.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked_services/stacked_services.dart';

import 'local_storage_services.dart';

class GetUserProfile {
  final log = getLogger('Get User Profile');
  final _api = ZuriApi(coreBaseUrl);
  final userService = locator<UserService>();
  final snackbar = locator<SnackbarService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  /// Fetches info of the current user
  /// This fetches the info of the user currently logged on the device
  Future<ProfileModel> currentUser() async {
    String? orgId = storageService.getString(StorageKeys.currentOrgId);
    String? memId = storageService.getString(StorageKeys.currentMemberID);

    String endPoint = '/organizations/$orgId/members/$memId';
// 614f093de35bb73a77bc2bc4
    final res = await _api.get(endPoint, token: token);

    if (res?.statusCode == 200) {
      // ignore: avoid_print
      print(StorageKeys.currentMemberID.toString());
      storageService.setString(
        StorageKeys.firstName,
        res?.data['data']['first_name'],
      );
      storageService.setString(
        StorageKeys.email,
        res?.data['data']['email'],
      );
      storageService.setString(
        StorageKeys.displayName,
        res?.data['data']['display_name'],
      );
      storageService.setString(
        StorageKeys.status,
        res?.data['data']['bio'],
      );
      storageService.setString(
        StorageKeys.phoneNum,
        res?.data['data']['phone'],
      );
      // storageService.setString(
      //   StorageKeys.currentUserImageUrl,
      //   res?.data['data'][0]['image_url'],
      // );

      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 2),
          variant: SnackbarType.success,
          message: ''' Profile Loaded  Successfully''');
      ProfileModel profile = ProfileModel.fromJson(res?.data['data']);
      log.i(profile.displayName.toString());
      log.i(profile.email.toString());
      return profile;
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: ''' Profile Load failed''',
      );
      return ProfileModel(
          // imageUrl: res.data?['data'][0]['image_url'],
          firstName: res.
          data?['data']['first_name'],
          displayName: res.data?['data']['display_name'],
          email: res.data?['data']['email'],
          status: res.data?['data']['bio'],
          phoneNum: res.data?['data']['phone']);
    }
  }

  /// This is yet to be implemented, this shows the Profile of other users
  /// in an organization
  // Future<ProfileModel> otherUser() async {
  //   String? orgId = storageService.getString(StorageKeys.currentOrgId);
  //   String? memId = userService.currentMemberId;

  //   String endPoint = '/organizations/$orgId/members/614f093de35bb73a77bc2bc4';

  //   final res = await _api.get(endPoint, token: token);

  //   if (res?.statusCode == 200) {
  //     // ignore: avoid_print
  //     print(StorageKeys.currentMemberID.toString());
  //     storageService.setString(
  //       StorageKeys.firstName,
  //       res?.data['data']['first_name'],
  //     );
  //     storageService.setString(
  //       StorageKeys.email,
  //       res?.data['data']['email'],
  //     );
  //     storageService.setString(
  //       StorageKeys.displayName,
  //       res?.data['data']['display_name'],
  //     );
  //     storageService.setString(
  //       StorageKeys.status,
  //       res?.data['data']['bio'],
  //     );
  //     storageService.setString(
  //       StorageKeys.phoneNum,
  //       res?.data['data']['phone'],
  //     );
  //     // storageService.setString(
  //     //   StorageKeys.currentUserImageUrl,
  //     //   res?.data['data'][0]['image_url'],
  //     // );

  //     snackbar.showCustomSnackBar(
  //         duration: const Duration(seconds: 2),
  //         variant: SnackbarType.success,
  //         message: ''' Profile Loaded  Successfully''');
  //     ProfileModel profile = ProfileModel.fromJson(res?.data['data']);
  //     log.i(profile.displayName.toString());
  //     log.i(profile.email.toString());
  //     return profile;
  //   } else {
  //     snackbar.showCustomSnackBar(
  //       duration: const Duration(seconds: 3),
  //       variant: SnackbarType.failure,
  //       message: ''' Profile Load failed''',
  //     );
  //     return ProfileModel(
  //         // imageUrl: res.data?['data'][0]['image_url'],
  //         firstName: res.data?['data']['first_name'],
  //         displayName: res.data?['data']['display_name'],
  //         email: res.data?['data']['email'],
  //         status: res.data?['data']['bio'],
  //         phoneNum: res.data?['data']['phone']);
  //   }
  // }
}
