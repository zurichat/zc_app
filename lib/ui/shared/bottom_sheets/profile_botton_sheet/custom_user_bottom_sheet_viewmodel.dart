import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.router.dart';
import '../../../../models/user_model.dart';
import '../../../../package/base/server-request/api/http_api.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/storage_keys.dart';

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
    final response = await _apiService.get('users/$userID',
        headers: {'Authorization': 'Bearer $currentSessionToken'});
    _userModel = UserModel.fromJson(response!.data['data']);
    print(response);
  }

  UserModel? get userModel => _userModel;
}