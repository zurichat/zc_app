import 'package:hng/ui/shared/shared.dart';

import '../../../../app/app.locator.dart';
import '../../../../services/local_storage_services.dart';
import '../../../../utilities/storage_keys.dart';
import '../api/http_api.dart';

class DMApiService {
  final _api = HttpApiService(dmsBaseUrl);
  final storageService = locator<SharedPreferenceLocalStorage>();

  String? get token =>
      storageService.getString(StorageKeys.currentSessionToken);
}
