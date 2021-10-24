//On login or signup the user service is used to save all the user details
import 'dart:convert';

import 'package:zurichat/models/user_model.dart';

import '../../app/app.locator.dart';
import '../../models/organization_model.dart';
import '../app_services/local_storage_services.dart';
import '../../utilities/constants/storage_keys.dart';

///This class dont do anything special than calling the local storage
///And returning the data that is saved, you can choose to use it or
///get the data to local storage yourself
class UserService {
  bool? get hasUser => null;
  final _sharedPrefs = locator<SharedPreferenceLocalStorage>();

  //All this are the current user details to be used
  String _currentOrgId = '';
  String _currentOrgUrl = '';
  String _currentOrgName = '';
  String _currentOrgLogo = '';
  String _authToken = '';
  String _userId = '';
  String _userEmail = '';

  ///This will give you null because organization data has not been added
  OrganizationModel? organizationModel;

  ///From the organization side bar set the current organissation Id
  ///and get it anywhere in the app using these getter
  String get currentOrgId {
    _currentOrgId = _sharedPrefs.getString(StorageKeys.currentOrgId) ?? '';
    //You can perform other function before returning
    return _currentOrgId;
  }

  String get currentOrgName {
    _currentOrgName = _sharedPrefs.getString(StorageKeys.currentOrgName) ?? '';
    //You can perform other function before returning
    return _currentOrgName;
  }

  String get currentOrgLogo {
    _currentOrgLogo = _sharedPrefs.getString(StorageKeys.currentOrgLogo) ?? '';
    //You can perform other function before returning
    return _currentOrgLogo;
  }

  String get currentOrgUrl {
    _currentOrgUrl = _sharedPrefs.getString(StorageKeys.currentOrgUrl) ?? '';
    //You can perform other function before returning
    return _currentOrgUrl;
  }

  void setUserDetails(UserModel user) {
    final val = jsonEncode(user.toMap());
    _sharedPrefs.setString(StorageKeys.currentUserModel, val);
  }

  void setOrganization() {
    // TODO implement Organization setter
  }

  ///From the organization side bar set the current organissation Id
  void setCurrentOrganizationId(String currentOrgId) {
    _currentOrgId = currentOrgId;
    _sharedPrefs.setString(StorageKeys.currentOrgId, _currentOrgId);
  }

  ///Get the token on app launch and to know if the user has
  ///formerly been loggen in. Show the home page instead of login view
  String get authToken {
    _authToken = _sharedPrefs.getString(StorageKeys.currentSessionToken) ?? '';
    //You can perform other function before returning
    return _authToken;
  }

  String get userId {
    _userId = _sharedPrefs.getString(StorageKeys.currentUserId) ?? '';
    //You can perform other function before returning
    return _userId;
  }

  String get memberId {
    _userId = _sharedPrefs.getString(StorageKeys.idInOrganization) ?? '';
    //You can perform other function before returning
    return _userId;
  }

  String get userEmail {
    _userEmail = _sharedPrefs.getString(StorageKeys.currentUserEmail) ?? '';
    //You can perform other function before returning
    return _userEmail;
  }

  UserModel? get userDetails {
    final res = _sharedPrefs.getString(StorageKeys.currentUserModel);
    if (res == null) {
      return null;
    }
    return UserModel.fromMap(jsonDecode(res));
  }

  void setUserAndToken({
    required String? authToken,
    required String? userId,
    required String? userEmail,
  }) {
    //TODO: throw error for null parameters
    _authToken = authToken ?? '';
    _userId = userId ?? '';
    _userEmail = userEmail ?? '';

    _sharedPrefs.setString(StorageKeys.currentUserEmail, _userEmail);
    _sharedPrefs.setString(StorageKeys.currentSessionToken, _authToken);
    _sharedPrefs.setString(StorageKeys.currentUserId, _userId);
  }
}
