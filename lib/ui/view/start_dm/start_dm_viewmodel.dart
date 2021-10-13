import 'package:hng/package/base/server-request/api/zuri_api.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/start_dm_models.dart';
import '../../../services/local_storage_services.dart';
import '../../../utilities/storage_keys.dart';

class StartDmViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final zuriApi = ZuriApi(coreBaseUrl);
  final storageService = locator<SharedPreferenceLocalStorage>();
  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);

  navigateBack() {
    navigationService.back();
  }

  // bool _hasClickedMessageField = false;
  // bool get hasClickedMessageField => _hasClickedMessageField;

  Future<List<UserModel>> allUsers() async {
    final _currentOrgId = storageService.getString(StorageKeys.currentOrgId);
    // print("_currentOrgId ${storageService.
    // getString(StorageKeys.currentOrgId)}");
    // print("_currentOrgId $_currentOrgId");
    final token = storageService.getString(StorageKeys.currentSessionToken);
    // print("token ${storageService.
    // getString(StorageKeys.currentSessionToken)}");
    // print("token $token");
    final endpoint =
        '/organizations/${storageService.getString(StorageKeys.currentUserId)}/members/';
    try {
      if (_currentOrgId == null || token == null) {
        return [];
      }
      final response = await zuriApi.get(
        endpoint,
        token: token,
      );
      // print(response);
      // print(response?.data?['data']);
      if (response?.statusCode == 200) {
        // print(response?.data?['data'].length);
        return (response?.data?['data'] as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<UserModel>> get userResults async {
    final _userResults = await allUsers();
    // print("Donnnneee");
    // print("_userResults $_userResults");
    return [..._userResults];
  }

  // onTapMessageField() {
  //   _hasClickedMessageField = true;
  //   notifyListeners();
  // }

  // onUnfocusMessageField() {
  //   _hasClickedMessageField = false;
  //   notifyListeners();
  // }

  // void focusScope(focus) {
  //   if (focus) {
  //     onTapMessageField();
  //   } else {
  //     onUnfocusMessageField();
  //   }
  //   notifyListeners();
  // }

  @override
  void setFormStatus() {}
}
