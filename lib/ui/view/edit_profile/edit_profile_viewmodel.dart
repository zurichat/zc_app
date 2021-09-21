import 'package:hng/app/app.locator.dart';
import 'package:hng/general_widgets/app_toast.dart';
import 'package:hng/models/profile_model.dart';

import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/enums.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

ProfileModel userData = new ProfileModel();
String _nameD = '', _displayD = '', _statusD = '', _phoneD = '';
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
  String? get userName => name;

  String? displayName = _displayD;
  String? get dispName => dispName;

  String? phoneNum = _phoneD;
  String? get phoneNo => phoneNum;

  String? profileText = _statusD;
  String? get status => profileText;
  final _navigationService = locator<NavigationService>();

  void exitPage() {
    _navigationService.back();
  }

  Future<void> fetchUser() async {
    try {
      if (!await connectivityService.checkConnection()) {
        AppToast.instance.message(null, 'Check your internet connection');
        return;
      }
      setBusy(true);
      userData = await GetUserProfile().currentUser();
      if (userData.firstName!.trim().isNotEmpty) {
        _nameD = userData.firstName!;
      } else {
        _nameD = '';
      }
      if (userData.displayName!.trim().isNotEmpty) {
        _displayD = 'The Back End for this does not exist';
        //_displayD = userData.displayName!;
      } else {
        _displayD = 'The Back End for this does not exist';
      }
      if (userData.status!.trim().isNotEmpty) {
        _statusD = 'The Back End for this does not exist';
        //_statusD = userData.status!;
      } else {
        _statusD = 'The Back End for this does not exist';
      }
      if (userData.phoneNumber!.trim().isNotEmpty) {
        _phoneD = 'The Back End for this does not exist';
        //_phoneD = userData.phoneNumber!;
      } else {
        _phoneD = 'The Back End for this does not exist';
      }
      setBusy(false);
    } catch (e) {
      AppToast.instance.error(null, 'Error Occured');
    }
  }

  final storageService = locator<SharedPreferenceLocalStorage>();
  Future updateProfile() async {
    String? orgId = storageService.getString(StorageKeys.currentOrgId);
    String? userId = storageService.getString(StorageKeys.currentUserId);
    //TODO CHange these links to there rightful values once they can be updated
    //I interchanged most calls because at the point of writing they did not have their patch call
    String link =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7/photo';

    final editData = {
      'image_url': _name,
    };
    final res = await _api.patch(link, data: editData, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
    String link3 =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7/status';

    final editData3 = {'status': _status};
    final res3 = await _api.patch(link3, data: editData3, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });

    final snackbar = locator<SnackbarService>();
    if (res!.statusCode == 200) {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 5),
        variant: SnackbarType.success,
        message: ''' Profile Update Was Successful'''
            ''' Please Close and Open The Edit Profile Page twice to see changes ''',
      );
      exitPage();
    } else {
      snackbar.showCustomSnackBar(
        duration: const Duration(seconds: 3),
        variant: SnackbarType.failure,
        message: ''' Profile Update failed''',
      );
    }

    String link1 =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7/profile';

    final editData1 = {
      'data': _display,
    };
    final res1 = await _api.patch(link1, data: editData1, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });

    String link2 =
        'organizations/61459d8e62688da5302acdb1/members/614729a2f41cb684cc531ac7/phone';

    final editData2 = {
      'phone': _phone,
    };
    final res2 = await _api.patch(link2, data: editData2, headers: {
      'Authorization':
          'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
    });
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
