import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zurichat/app/app.locator.dart';
import 'package:zurichat/app/app.logger.dart';
import 'package:zurichat/services/app_services/connectivity_service.dart';
import 'package:zurichat/services/app_services/local_storage_services.dart';
import 'package:zurichat/services/messaging_services/channels_api_service.dart';
import 'package:zurichat/ui/view/general_search/general_search_view.form.dart';
import 'package:zurichat/utilities/constants/storage_keys.dart';

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

  void removeRecent(String search) {
    storageService.setStringList(
        StorageKeys.recentSearches, recentSearches..remove(search));
    notifyListeners();
  }

  void clearResults() {
    isShowingResults = false;
    notifyListeners();
  }

  void search() async {
    if (searchValue?.isNotEmpty == true) {
      isShowingResults = true;
      notifyListeners();

      storageService.setStringList(
          StorageKeys.recentSearches,
          recentSearches
            ..remove(searchValue!)
            ..add(searchValue!));
    }

    notifyListeners();
  }
}
