import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/start_dm_models.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomUserBottomSheetViewModel extends FutureViewModel {
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
    final response = await _apiService.get('$UserDataEndpoint$userID',
        headers: {'Authorization': 'Bearer $currentSessionToken'});
    _userModel = UserModel.fromJson(response!.data['data']);
  }

  UserModel? get userModel => _userModel;
}
