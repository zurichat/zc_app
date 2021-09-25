import 'package:hng/app/app.locator.dart';

import 'package:hng/models/start_dm_models.dart';
import 'package:hng/package/base/server-request/api/http_api.dart';

import 'package:hng/services/local_storage_services.dart';
import 'package:hng/ui/view/start_dm/widgets/custom_chip_input.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:hng/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartDmViewModel extends FormViewModel {
  final navigationService = locator<NavigationService>();
  final _api = HttpApiService(coreBaseUrl);
  final storageService = locator<SharedPreferenceLocalStorage>();

  // bool _hasClickedMessageField = false;
  // bool get hasClickedMessageField => _hasClickedMessageField;

  Future<List<UserModel>> allUsers() async {
    String? _currentOrgId = storageService.getString(StorageKeys.currentOrgId);
    // print("_currentOrgId ${storageService.getString(StorageKeys.currentOrgId)}");
    // print("_currentOrgId $_currentOrgId");
    String? token = storageService.getString(StorageKeys.currentSessionToken);
    // print("token ${storageService.getString(StorageKeys.currentSessionToken)}");
    // print("token $token");
    String endpoint =
        '/organizations/${storageService.getString(StorageKeys.currentOrgId)}/members/';
    try {
      if (_currentOrgId == null || token == null) {
        return [];
      }
      final response = await _api.get(
        endpoint,
        headers: {
          'Authorization':
              'Bearer ${storageService.getString(StorageKeys.currentSessionToken)}'
        },
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
    List<UserModel> _userResults = await allUsers();
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