import '../../../../app/app.locator.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';
import '../api/http_api.dart';

class ChannelsApiService {
  final _api = HttpApiService('https://channels.zuri.chat/');
  final storageService = locator<SharedPreferenceLocalStorage>();

// Your functions for api calls can go in here

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);
}
