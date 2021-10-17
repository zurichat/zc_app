import 'package:zurichat/services/local_storage_services.dart';
import 'package:zurichat/services/zuri_theme_service.dart';
import 'package:zurichat/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../utilities/enums.dart';


class PreferenceViewModel extends BaseViewModel {
  final log = getLogger('PreferenceViewModel');
  final _zuriThemeService = locator<ZuriThemeService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();

  String currentTheme = 'Off';
  int currentThemeValue = 0;
  bool isDarkMode = false;
  List themes = [
    'Off',
    'On',
  ];

  init() {
    currentTheme = _storageService.getString(StorageKeys.currentTheme) ?? 'Off';
    currentThemeValue =
        _storageService.getInt(StorageKeys.currentThemeValue) ?? 0;
    isDarkMode = currentTheme == 'On' ? true : false;
    notifyListeners();
  }

  changeTheme(value) {
    if (value == true) {
      currentThemeValue = 1;
      currentTheme = 'On';
      isDarkMode = true;
      _zuriThemeService.selectThemeAtIndex(currentThemeValue);
      notifyListeners();
    } else {
      currentThemeValue = 0;
      currentTheme = 'Off';
      isDarkMode = false;
      _zuriThemeService.selectThemeAtIndex(currentThemeValue);
      notifyListeners();
    }
    _storageService.setString(StorageKeys.currentTheme, currentTheme);
    _storageService.setInt(StorageKeys.currentThemeValue, currentThemeValue);

    notifyListeners();
  }

  void exitPage() {
    _navigationService.back();
  }

  Future navigateLanguageAndRegion() async {
    await _navigationService.navigateTo(Routes.languageAndRegionModelView);
  }

  void setTheme() {}

  Future navigateToAdvanced() async {
    await _navigationService.navigateTo(Routes.advancedView);
  }

  Future sendFeedback() async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.feedback,
    );

    if (dialogResult != null && dialogResult.confirmed == true) {
      log.i(dialogResult.data);
      notifyListeners();
    }
  }

  void helpCentre() {}

  void privacyAndLicences() {}
}
