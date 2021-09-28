import 'package:hng/app/app.locator.dart';
import 'package:hng/models/profile_model.dart';

import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/api_service.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/current_user_profile.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

String _name = '', _display = '', _status = '', _phone = '';

class EditProfileViewModel extends FutureViewModel {
  ProfileModel userData = ProfileModel();
  final snackbar = locator<SnackbarService>();
  final navigationService = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final _api = HttpApiService(coreBaseUrl);
  final _storage = locator<SharedPreferenceLocalStorage>();
  UserModel? _userModel;

  Future futureToRun() async {
    final userID = _storage.getString(StorageKeys.currentUserId);
    final currentSessionToken =
        _storage.getString(StorageKeys.currentSessionToken);
    final response = await _api.get('users/$userID',
        headers: {'Authorization': 'Bearer $currentSessionToken'});
    _userModel = UserModel.fromJson(response!.data['data']);
  }

  UserModel? get userModel => _userModel;

  Future updateDetails() async {
    final userData = {
      'first_name': fullNameValue,
      'phone_number': phoneNumberValue,
      'last_name': displayNameValue
    };
    final currentSessionToken =
        _storage.getString(StorageKeys.currentSessionToken);
    final userId = _storage.getString(StorageKeys.currentUserId);
    final res = await _api.patch('/users/$userId',
        data: userData,
        headers: {'Authorization': 'Bearer $currentSessionToken'});
    _userModel = UserModel.fromJson(res!.data['data']);
    navigationService.pushNamedAndRemoveUntil(Routes.navBarView);
  }

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

  final _navigationService = locator<NavigationService>();

  void exitPage() {
    _navigationService.back();
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
    final snackbar = locator<SnackbarService>();

    if (editResponse!.statusCode == 200) {
      snackbar.showCustomSnackBar(
          duration: const Duration(seconds: 5),
          variant: SnackbarType.success,
          message: ''' Profile Update Was Successful''');
      await GetUserProfile().currentUser();
      _navigationService.back();
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: ''' Profile Update failed''',
      );
    }
  }

  @override
  Future futureToRun() async {
    setBusy(true);
    userData = await GetUserProfile().currentUser();
    setBusy(false);
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }
}

//I didn't put this in a service because the backend doesn't have calls for many of the elements here
class GetUserProfile {
  final _api = HttpApiService('https://api.zuri.chat/');

  final storageService = locator<SharedPreferenceLocalStorage>();

  /// Fetches info of the current user
  Future<ProfileModel> currentUser() async {
    String? orgId = storageService.getString(StorageKeys.currentOrgId);
    String? userId = storageService.getString(StorageKeys.currentUserId);
    String link =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7';

    final res = await _api.get(link, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
    final snackbar = locator<SnackbarService>();
    if (res!.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 5),
        variant: SnackbarType.success,
        message: ''' Profile Loaded  Successfully'''
            '''  Please Exit The Edit Profile Page Then Open It Once More ''',
      );
      return ProfileModel(
          firstName: res.data?['data']['image_url'],
          displayName: res.data?['data']['profile'],
          status: res.data?['data']['status']);
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: ''' Profile Load failed''',
      );
      return ProfileModel(
          firstName: res.data?['data']['image_url'],
          displayName: res.data?['data']['profile'],
          status: res.data?['data']['status']);
    }
  }
}
