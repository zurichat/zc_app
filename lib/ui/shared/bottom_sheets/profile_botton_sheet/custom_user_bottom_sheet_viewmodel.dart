import 'package:hng/general_widgets/app_toast.dart';
import 'package:hng/models/profile_model.dart';
import 'package:hng/services/connectivity_service.dart';
import 'package:hng/services/current_user_profile.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/user_model.dart';
import '../../../../package/base/server-request/api/http_api.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/storage_keys.dart';

ProfileModel userData = new ProfileModel();
String _nameD = '', _displayD = '', _statusD = '', _phoneD = '';

class CustomUserBottomSheetViewModel extends FutureViewModel {
  String photoUrl = _nameD;
  String get url => photoUrl;

  String name = _nameD;
  String get userName => name;

  String displayName = _displayD;
  String get dispName => dispName;

  String phoneNum = _phoneD;
  String get phoneNo => phoneNum;

  String profileText = _statusD;
  String get status => profileText;

  final snackbar = locator<SnackbarService>();
  final navigationService = locator<NavigationService>();
  final connectivityService = locator<ConnectivityService>();
  final _api = HttpApiService('https://api.zuri.chat/');

  final _navigationService = locator<NavigationService>();
  final _storage = locator<SharedPreferenceLocalStorage>();
  final _apiService = HttpApiService(coreBaseUrl);
  UserModel? _userModel;

  void navigateToSetStatus() =>
      _navigationService.navigateTo(Routes.setStatusView);

  void navigateToEditProfile() =>
      _navigationService.navigateTo(Routes.editProfileView);

  @override
  Future<void> futureToRun() async {
    final userID = _storage.getString(StorageKeys.currentUserId);
    final currentSessionToken =
        _storage.getString(StorageKeys.currentSessionToken);
    final response = await _apiService.get('users/$userID',
        headers: {'Authorization': 'Bearer $currentSessionToken'});
    _userModel = UserModel.fromJson(response!.data['data']);
  }

//Fetches User data profile data
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

  UserModel? get userModel => _userModel;
}
