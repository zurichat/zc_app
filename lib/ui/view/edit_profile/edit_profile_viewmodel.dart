import 'package:hng/app/app.locator.dart';
import 'package:hng/general_widgets/app_toast.dart';
import 'package:hng/models/profile_model.dart';

import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/current_user_profile.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

ProfileModel userData = new ProfileModel();
String _nameD = '',
    _displayD = '',
    _statusD = '',
    _phoneD = '',
    grace = 'Omo your code is running on grace and inshaalah';
String _name = '', _display = '', _status = '', _phone = '';

class EditProfileViewModel extends BaseViewModel {
  final snackbar = locator<SnackbarService>();
  final navigationService = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final _api = HttpApiService('https://api.zuri.chat/');

  void updateString(String name, String display, String status, String phone) {
    if (name.trim().isNotEmpty) {
      _name = name;
    }
    if (display.trim().isNotEmpty) {
      _display = display;
    }
    if (status.trim().isNotEmpty) {
      _status = status;
    }
    if (phone.trim().isNotEmpty) {
      _phone = phone;
    }
  }

  String? photoUrl = _nameD;
  String? get url => photoUrl;

  String? name = _nameD;

  String? displayName = _displayD;

  String? phoneNum = _phoneD;

  String? profileText = _statusD;

  final _navigationService = locator<NavigationService>();

  void exitPage() {
    _navigationService.back();
  }

  Future<void> fetchUser() async {
    setBusy(true);

    _nameD = storageService.getString(StorageKeys.firstName)!;

    _displayD = storageService.getString(StorageKeys.displayName)!;
    //_displayD = userData.displayName!;

    _statusD = storageService.getString(StorageKeys.status)!;
    //_statusD = userData.status!;

    _phoneD = storageService.getString(StorageKeys.phone_num)!;
    //_phoneD = userData.phoneNumber!;

    setBusy(false);
  }

  final storageService = locator<SharedPreferenceLocalStorage>();
  Future updateProfile() async {
    String? orgId = storageService.getString(StorageKeys.currentOrgId);
    String? memId = storageService.getString(StorageKeys.currentMemberID);
    //TODO CHange these links to there rightful values once they can be updated

    String profileEndPoint = 'organizations/$orgId/members/$memId/profile';

    final profileData = {
      'bio': _status,
      'first_name': _name,
      'display_name': _display,
      'phone': _phone
    };
    final editResponse =
        await _api.patch(profileEndPoint, data: profileData, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
    print(editResponse);
    final snackbar = locator<SnackbarService>();

    if (editResponse!.statusCode == 200) {
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 5),
          variant: SnackbarType.success,
          message: ''' Profile Update Was Successful''');
      await GetUserProfile().currentUser();
      print('I am ending');
      _navigationService.back();
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: ''' Profile Update failed''',
      );
    }
  }
}

//I didn't put this in a service because the backend doesn't have calls for many of the elements here
