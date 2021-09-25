import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../utilities/enums.dart';

class PreferenceViewModel extends BaseViewModel {
  final log = getLogger('PreferenceViewModel');
  ThemeService _themeService = locator<ThemeService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  String currentTheme = 'System Default';
  int currentThemeValue = 1;

  List themes = [
    'System Default',
    'Off',
    'On',
    'Kimbie Dark',
  ];

  Future changeTheme() async {
    final dialogResult = await _dialogService.showCustomDialog(
      variant: DialogType.themeMode,
      data: {'themes': themes, 'currentThemeValue': currentThemeValue},
    );

    if (dialogResult != null && dialogResult.confirmed == true) {
      log.i(dialogResult.data);
      currentThemeValue = dialogResult.data;
      _themeService.selectThemeAtIndex(currentThemeValue);
      currentTheme = themes[dialogResult.data];

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
