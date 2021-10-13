import 'package:zurichat/package/base/server-request/dms/dms_api_service.dart';
import 'package:zurichat/services/local_storage_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DmPageViewModel extends FutureViewModel<bool> {
  final navigationService = locator<NavigationService>();
  final _dmsApiService = locator<DMApiService>();
  final storageService = locator<SharedPreferenceLocalStorage>();

  Future<bool> getActiveDMs() async {
    // final usersInOrg = await _dmsApiService.getAllUsersInOrg();
    final res = await _dmsApiService.getActiveDms();
    if (res?.statusCode != 204) {
      // storageService.setString(
      //     StorageKeys.allMembersinOrganization, json.encode(usersInOrg?.data));
      // usersInOrg?.data.forEach((e) {
      // if (e['email'] ==
      //     storageService.getString(StorageKeys.currentUserEmail)) {
      //   storageService.setString(StorageKeys.currentMemberId, e['_id']);
      //   }
      // });

      return true;
    } else {
      return false;
    }
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
