import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.router.dart';
import 'package:zurichat/constants/app_strings.dart';
import 'package:zurichat/models/start_dm_models.dart';
import 'package:zurichat/package/base/server-request/api/zuri_api.dart';
import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/utilities/constants.dart';
import 'package:zurichat/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomUserBottomSheetViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  static final _storage = locator<SharedPreferenceLocalStorage>();
  final zuriApi = ZuriApi(coreBaseUrl);

  UserModel? _userModel;

  void navigateToSetStatus() =>
      _navigationService.navigateTo(Routes.setStatusView);

  void navigateToEditProfile() =>
      _navigationService.navigateTo(Routes.editProfileView);

  final String? userID = _storage.getString(StorageKeys.currentUserId);
  final String? token = _storage.getString(StorageKeys.currentSessionToken);

  @override
  Future<void> futureToRun() async {
    final response = await zuriApi.get('$userDataEndpoint', token: token);
    _userModel = UserModel.fromJson(response!.data['data']);
  }

  UserModel? get userModel => _userModel;
}
