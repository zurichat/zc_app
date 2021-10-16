import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../package/base/jump_to_request/jump_to_api.dart';
import '../../../services/connectivity_service.dart';
import '../../../services/local_storage_services.dart';

class GeneralSearchViewModel extends FormViewModel {
  final log = getLogger('GeneralSearchViewModel');
  final navigation = locator<NavigationService>();
  final storageService = locator<SharedPreferenceLocalStorage>();
  final connectivityService = locator<ConnectivityService>();
  final api = locator<JumpToApi>();

  @override
  void setFormStatus() {}

  void navigateBack() => navigation.back();
}
