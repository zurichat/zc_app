import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/package/base/server-request/channels/channels_api_service.dart';
import 'package:zurichat/utilities/storage_keys.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../services/connectivity_service.dart';
import '../../../services/local_storage_services.dart';

class GeneralSearchViewModel extends FormViewModel {
  final log = getLogger('GeneralSearchViewModel');

  final storageService = locator<SharedPreferenceLocalStorage>();
  final connectivityService = locator<ConnectivityService>();
  final navigationService = locator<NavigationService>();
  final apiService = locator<ChannelsApiService>();

  late List<String> recentSearches;
  bool isShowingResults = false;

  @override
  void setFormStatus() {}

  void navigateBack() => navigationService.back();

  void navigateToPeopleBrowser() {}

  void navigateToChannelBrowser() {}

  void init() async {
    recentSearches =
        storageService.getStringList(StorageKeys.recentSearches) ?? [];
  }

  void removeRecent(String needle) {
    storageService.setStringList(
        StorageKeys.recentSearches, recentSearches..remove(needle));
    notifyListeners();
  }

  void search(String needle) async {
    if (needle.isNotEmpty) {
      isShowingResults = true;
      storageService.setStringList(
          StorageKeys.recentSearches,
          recentSearches
            ..remove(needle)
            ..add(needle));
    }

    notifyListeners();
  }
}
