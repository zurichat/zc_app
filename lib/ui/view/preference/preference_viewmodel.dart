import 'package:hng/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class PreferenceViewModel extends BaseViewModel {
  ThemeService _themeService = locator<ThemeService>();

  switchtoDefaultLight() {
    _themeService.selectThemeAtIndex(0);
    print('Default Light Activated');
  }

  switchtoLight() {
    _themeService.selectThemeAtIndex(1);
    print('Light Activated');
  }

  switchtoDark() {
    _themeService.selectThemeAtIndex(2);
    print('Dark Activated');
  }

  switchtoKimbieDark() {
    _themeService.selectThemeAtIndex(3);
    print('Kimbie Dark Activated');
  }
}
