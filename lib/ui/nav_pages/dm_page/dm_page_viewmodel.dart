import 'dart:convert';

import 'package:hng/package/base/server-request/dms/dms_api_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmPageViewModel extends FutureViewModel<bool> {
  //TODO: These were commented out because the backend is currently very unstable, and a lot things are still not working there
  final navigationService = locator<NavigationService>();
  //final _dmsApiService = locator<DMApiService>();
  final storageService = locator<SharedPreferenceLocalStorage>();

  Future<bool> getActiveDMs() async {
    // final res = await _dmsApiService.getActiveDms();
    // // final usersInOrg = await _dmsApiService.getAllUsersInOrg();
    // // storageService.setString(
    // //     StorageKeys.allMembersinOrganization, jsonEncode(usersInOrg?.data));
    // // usersInOrg?.data.forEach((e) {
    // //   if (e['email'] ==
    // //       storageService.getString(StorageKeys.currentUserEmail)) {
    // //     storageService.setString(StorageKeys.currentMemberId, e['_id']);
    // //   }
    // // });
    // if (res?.statusCode != 204) {
    //   List response = res.data;
    //   if (response.isEmpty) {
    //     return false;
    //   } else {
    //     return true;
    //   }
    // } else {
    //   return false;
    // }

    await Future.delayed(const Duration(seconds: 1));
    return false;
  }

  void navigateToDmUserView() {
    navigationService.navigateTo(Routes.dmUserView);
  }

  void navigateToDmScreen() {
    navigationService.navigateTo(Routes.dmScreen);
  }

  void navigateToJumpToScreen() {
    navigationService.navigateTo(Routes.dmJumpToView);
  }

  @override
  Future<bool> futureToRun() {
    return getActiveDMs();
  }
}
