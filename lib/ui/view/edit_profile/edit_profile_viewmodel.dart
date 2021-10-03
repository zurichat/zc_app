import 'package:hng/app/app.locator.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/profile_model.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/api_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/current_user_profile.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

String _fullName = '', _displayName = '', _status = '', _phoneNum = '';

class EditProfileViewModel extends FutureViewModel {
  ProfileModel currentUserData = ProfileModel();
  final snackbar = locator<SnackbarService>();
  final navigationService = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final _api = ZuriApi(coreBaseUrl);
  final api = ApiService();
  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  void updateString(String name, String display, String status, String phone) {
    if (name.trim().isNotEmpty) {
      _fullName = name;
    }
    if (display.trim().isNotEmpty) {
      _displayName = display;
    }
    if (status.trim().isNotEmpty) {
      _status = status;
    }
    if (phone.trim().isNotEmpty) {
      _phoneNum = phone;
    }
  }

  final _navigationService = locator<NavigationService>();

  void exitPage() {
    _navigationService.back();
  }

  Future updateProfile() async {
    String? orgId = storageService.getString(StorageKeys.currentOrgId);
    String? memId = storageService.getString(StorageKeys.currentMemberID);

    final profileEndPoint = 'organizations/$orgId/members/$memId/profile';
// 614f093de35bb73a77bc2bc4
    final profileData = {
      'bio': _status,
      'first_name': _fullName,
      'display_name': _displayName,
      'phone': _phoneNum,
    };
    final editResponse =
        await _api.patch(profileEndPoint, body: profileData, token: token);
       
    if (editResponse?.statusCode == 200) {
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 5),
          variant: SnackbarType.success,
          message: UpdateSuccessful);
      await GetUserProfile().currentUser();
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: UpdateFailed,
      );
    }
  }

  @override
  Future futureToRun() async {
    setBusy(true);
    currentUserData = await GetUserProfile().currentUser();
    setBusy(false);
  }
}

//I didn't put this in a service because the backend doesn't have calls for many of the elements here
