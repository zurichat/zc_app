import 'package:hng/app/app.locator.dart';
import 'package:hng/app/app.router.dart';
import 'package:hng/constants/app_strings.dart';
import 'package:hng/models/start_dm_models.dart';
import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/constants.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomUserBottomSheetViewModel extends FutureViewModel {
  final _navigationService = locator<NavigationService>();
  static final _storage = locator<SharedPreferenceLocalStorage>();
  final zuriApi = locator<ZuriApi>();
  UserModel? _userModel;

  void navigateToSetStatus() =>
      _navigationService.navigateTo(Routes.setStatusView);

  void navigateToEditProfile() =>
      _navigationService.navigateTo(Routes.editProfileView);

  final String? userID = _storage.getString(StorageKeys.currentUserId);
  final String? token = _storage.getString(StorageKeys.currentSessionToken);

  @override
  Future<void> futureToRun() async {
    final response = await zuriApi.get('$UserDataEndpoint', token: token);
    _userModel = UserModel.fromJson(response!.data['data']);
  }

  UserModel? get userModel => _userModel;
}
