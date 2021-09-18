import '../../../../app/app.locator.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';
import '../api/http_api.dart';

class DMApiService {
  final _api = HttpApiService('https://dm.zuri.chat/');
  final storageService = locator<SharedPreferenceLocalStorage>();

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);
}
