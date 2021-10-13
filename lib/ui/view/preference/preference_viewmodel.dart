import 'package:hng/constants/app_strings.dart';
import 'package:hng/services/local_storage_services.dart';
import 'package:hng/utilities/storage_keys.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../utilities/enums.dart';

class PreferenceViewModel extends BaseViewModel {
  final log = getLogger('PreferenceViewModel');
  final ThemeService _themeService = locator<ThemeService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _storageService = locator<SharedPreferenceLocalStorage>();

  String? currentTheme = 'Off';
  int currentThemeValue = 0;
  List themes = [
    'Off',
    'On',
  ];

  init() {
    currentTheme = _storageService.getString(StorageKeys.currentTheme) ?? 'Off';
    currentThemeValue =
        _storageService.getInt(StorageKeys.currentThemeValue) ?? 0;
  }

  Future changeTheme() async {
    final dialogResult = await _dialogService.showCustomDialog(
      title: DarkMode,
      barrierDismissible: false,
      variant: DialogType.themeMode,
      data: {'themes': themes, 'currentThemeValue': currentThemeValue},
    );

    if (dialogResult != null && dialogResult.confirmed == true) {
      log.i(dialogResult.data);
      currentThemeValue = dialogResult.data;
      _themeService.selectThemeAtIndex(currentThemeValue);
      currentTheme = themes[dialogResult.data];
      _storageService.setString(
          StorageKeys.currentTheme, themes[dialogResult.data]);

      _storageService.setInt(StorageKeys.currentThemeValue, dialogResult.data);

      notifyListeners();
    }
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
